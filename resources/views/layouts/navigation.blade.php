<nav class="cotec-topbar" aria-label="Navegación principal">
    <div class="cotec-topbar-inner">
        <a href="{{ route('dashboard') }}" class="flex shrink-0 items-center gap-3 rounded-lg focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#14532d]">
            @if (file_exists(public_path('build/images/logo-lyra.png')))
                <img src="{{ asset('build/images/logo-lyra.png') }}" alt="" class="h-10 w-10 object-contain" />
            @elseif (file_exists(public_path('build/images/logo-lyra.svg')))
                <img src="{{ asset('build/images/logo-lyra.svg') }}" alt="" class="h-10 w-10 object-contain" />
            @else
                <x-application-logo class="h-10 w-10" />
            @endif
            <span class="hidden text-sm font-bold tracking-wide text-[#14532d] sm:inline">
                {{ config('app.name', 'LYRA ERP') }}
            </span>
        </a>

        <div class="cotec-primary-nav" aria-label="Módulos">
            <x-nav-link :href="route('dashboard')" :active="request()->routeIs('dashboard')">
                Inicio
            </x-nav-link>
            @can('ver-productos')
                <x-nav-link :href="route('products.index')" :active="request()->routeIs('products.*')">
                    Productos
                </x-nav-link>
            @endcan
            @can('ver-categorias')
                <x-nav-link :href="route('categories.index')" :active="request()->routeIs('categories.*')">
                    Categorías
                </x-nav-link>
            @endcan
            @can('ver-clientes')
                <x-nav-link :href="route('clients.index')" :active="request()->routeIs('clients.*')">
                    Clientes
                </x-nav-link>
            @endcan
            @can('ver-proveedores')
                <x-nav-link :href="route('providers.index')" :active="request()->routeIs('providers.*')">
                    Proveedores
                </x-nav-link>
            @endcan
            @can('ver-ventas')
                <x-nav-link :href="route('sales.index')" :active="request()->routeIs('sales.*')">
                    Ventas
                </x-nav-link>
            @endcan
            @can('ver-compras')
                <x-nav-link :href="route('purchases.index')" :active="request()->routeIs('purchases.*')">
                    Compras
                </x-nav-link>
            @endcan
            @can('ver-inventario')
                <x-nav-link :href="route('inventory.kardex')" :active="request()->routeIs('inventory.*')">
                    Inventario
                </x-nav-link>
            @endcan
            @can('ver-auditoria')
                <x-nav-link :href="route('audit.index')" :active="request()->routeIs('audit.*')">
                    Auditoría
                </x-nav-link>
            @endcan
            @canany(['ver-usuarios', 'ver-roles', 'ver-permisos'])
                <x-nav-link :href="route('settings.index')" :active="request()->routeIs('settings.*')">
                    Configuración
                </x-nav-link>
            @endcanany
        </div>

        @auth
            <div class="cotec-topbar-actions">
                @php($unread = Auth::user()->unreadNotifications()->count())
                <a href="{{ route('notifications.index') }}"
                    class="relative inline-flex h-10 w-10 items-center justify-center rounded-full text-slate-600 transition hover:bg-emerald-50 hover:text-[#14532d] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#14532d]"
                    aria-label="Notificaciones{{ $unread > 0 ? ', '.$unread.' sin leer' : '' }}">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" aria-hidden="true">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M14.857 17.082a23.848 23.848 0 0 0 5.454-1.31A8.967 8.967 0 0 1 18 9.75V9a6 6 0 0 0-12 0v.75a8.967 8.967 0 0 1-2.311 6.022 23.848 23.848 0 0 0 5.454 1.31m5.714 0a24.255 24.255 0 0 1-5.714 0m5.714 0a3 3 0 1 1-5.714 0" />
                    </svg>
                    @if ($unread > 0)
                        <span class="absolute right-0 top-0 min-w-4 rounded-full bg-red-600 px-1 text-center text-[10px] font-bold leading-4 text-white">
                            {{ $unread }}
                        </span>
                    @endif
                </a>

                <x-dropdown align="right" width="48">
                    <x-slot name="trigger">
                        <button type="button" class="flex max-w-[14rem] items-center gap-2 rounded-full border border-slate-200 bg-white py-1.5 pl-1.5 pr-3 text-left transition hover:border-emerald-700/30 hover:bg-emerald-50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#14532d]">
                            <span class="flex h-8 w-8 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-xs font-bold text-[#14532d]">
                                {{ strtoupper(substr(Auth::user()->name, 0, 2)) }}
                            </span>
                            <span class="hidden min-w-0 sm:block">
                                <span class="block truncate text-xs font-semibold text-slate-800">{{ Auth::user()->name }}</span>
                                <span class="block text-[10px] capitalize text-slate-500">{{ Auth::user()->activeRole()?->name ?? 'Usuario' }}</span>
                            </span>
                            <svg class="h-4 w-4 shrink-0 text-slate-500" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                                <path fill-rule="evenodd" d="M5.22 7.47a.75.75 0 0 1 1.06 0L10 11.19l3.72-3.72a.75.75 0 1 1 1.06 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L5.22 8.53a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd" />
                            </svg>
                        </button>
                    </x-slot>

                    <x-slot name="content">
                        <x-dropdown-link href="{{ route('profile.edit') }}">
                            Mi perfil
                        </x-dropdown-link>
                        @if (Auth::user()->hasMultipleRoles())
                            <x-dropdown-link href="{{ route('active-role.edit') }}">
                                Cambiar rol
                            </x-dropdown-link>
                        @endif
                        <div class="my-1 border-t border-slate-100"></div>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <button type="submit" class="block w-full px-4 py-2 text-left text-sm font-medium text-slate-600 transition hover:bg-red-50 hover:text-red-700 focus-visible:outline focus-visible:outline-2 focus-visible:outline-red-600">
                                Cerrar sesión
                            </button>
                        </form>
                    </x-slot>
                </x-dropdown>
            </div>
        @endauth
    </div>
</nav>
