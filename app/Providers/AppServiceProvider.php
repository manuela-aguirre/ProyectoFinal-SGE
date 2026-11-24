<?php

namespace App\Providers;

use App\Models\User;
use Illuminate\Auth\Events\Failed;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Logout;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // Verificador de permisos del ERP. Reemplaza al de Spatie
        // (config/permission.php → 'register_permission_check_method' => false)
        // para respetar el ROL ACTIVO + los permisos DIRECTOS del usuario.
        // Lo usan: $user->can(), @can, el middleware 'permission:' y Gate::allows().
        Gate::before(function ($user, string $ability) {
            if (! $user instanceof User) {
                return null;
            }

            // true = autorizado. null = «no opino»: Laravel sigue con Policies/Gates y, si no hay, niega.
            return $user->hasPermissionInActiveRole($ability) ? true : null;
        });

        Event::listen(Login::class, fn (Login $e) => activity('seguridad')
            ->causedBy($e->user)->event('login')
            ->withProperties(['ip' => request()->ip()])
            ->log('inicio de sesión'));

        Event::listen(Failed::class, fn (Failed $e) => activity('seguridad')
            ->event('login_fallido')
            ->withProperties(['email' => $e->credentials['email'] ?? null, 'ip' => request()->ip()])
            ->log('intento de inicio de sesión fallido'));

        Event::listen(Logout::class, fn (Logout $e) => activity('seguridad')
            ->causedBy($e->user)->event('logout')
            ->log('cierre de sesión'));
    }
}
