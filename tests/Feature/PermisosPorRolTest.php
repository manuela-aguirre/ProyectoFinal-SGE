<?php

namespace Tests\Feature;

use App\Models\User;
use Database\Seeders\RolePermissionSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use PHPUnit\Framework\Attributes\DataProvider;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

/**
 * Matriz de seguridad convertida en pruebas: cada fila es [rol, URL, código HTTP esperado].
 * Si alguien cambia un permiso por error, esta prueba lo detecta.
 */
class PermisosPorRolTest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        $this->withoutVite();
        $this->seed(RolePermissionSeeder::class);
    }

    public static function matriz(): array
    {
        return [
            ['admin', '/configuracion', 200],
            ['admin', '/auditoria', 200],
            ['vendedor', '/sales/create', 200],
            ['vendedor', '/purchases', 403],
            ['vendedor', '/configuracion', 403],
            ['vendedor', '/inventario/kardex', 403],
            ['almacenista', '/purchases/create', 200],
            ['almacenista', '/inventario/kardex', 200],
            ['almacenista', '/sales', 403],
            ['almacenista', '/auditoria', 403],
            ['contador', '/sales', 200],
            ['contador', '/sales/create', 403],
            ['contador', '/configuracion', 403],
        ];
    }

    #[DataProvider('matriz')]
    public function test_acceso_por_rol(string $rol, string $url, int $esperado): void
    {
        $user = User::factory()->create()->assignRole($rol);
        $this->actingAs($user)->get($url)->assertStatus($esperado);
    }

    public function test_un_invitado_es_enviado_al_login(): void
    {
        $this->get('/sales')->assertRedirect('/login');
    }

    public function test_el_menu_superior_del_vendedor_respeta_sus_permisos(): void
    {
        $vendedor = User::factory()->create()->assignRole('vendedor');

        $this->actingAs($vendedor)
            ->get(route('sales.index'))
            ->assertOk()
            ->assertSee('href="'.route('sales.index').'"', false)
            ->assertDontSee('href="'.route('purchases.index').'"', false)
            ->assertDontSee('cotec-sidebar', false);
    }

    public function test_el_menu_superior_del_almacenista_respeta_sus_permisos(): void
    {
        $almacenista = User::factory()->create()->assignRole('almacenista');

        $this->actingAs($almacenista)
            ->get(route('purchases.index'))
            ->assertOk()
            ->assertSee('href="'.route('purchases.index').'"', false)
            ->assertDontSee('href="'.route('sales.index').'"', false)
            ->assertDontSee('cotec-sidebar', false);
    }

    public function test_el_dashboard_muestra_configuracion_si_el_usuario_puede_ver_roles(): void
    {
        Role::findByName('vendedor')->givePermissionTo('ver-roles');
        $vendedor = User::factory()->create()->assignRole('vendedor');

        $this->actingAs($vendedor)
            ->get(route('dashboard'))
            ->assertOk()
            ->assertSee('href="'.route('settings.index').'"', false);
    }
}
