<x-app-layout>
    <x-slot name="header">
        <div class="flex flex-wrap items-center justify-between gap-4">
            <div>
                <p class="text-xs font-bold uppercase tracking-[0.16em] text-emerald-800">Panel principal</p>
                <h2 class="mt-1 text-2xl font-bold tracking-tight text-slate-900">
                    Hola, {{ $user->name }}
                </h2>
                <p class="mt-1 text-sm text-slate-500">Resumen de operaciones y accesos de tu rol.</p>
            </div>
            <div class="flex flex-wrap items-center gap-3">
                <div class="rounded-xl border border-emerald-100 bg-emerald-50 px-4 py-2">
                    <p class="text-[0.65rem] font-bold uppercase tracking-wider text-emerald-800">Rol activo</p>
                    <p class="mt-0.5 text-sm font-semibold capitalize text-emerald-950">{{ $activeRole ?? 'Sin rol activo' }}</p>
                </div>
                @if ($roles->count() > 1)
                    <a href="{{ route('active-role.edit') }}" class="rounded-lg border border-slate-200 bg-white px-3 py-2 text-sm font-semibold text-slate-700 transition hover:border-emerald-700 hover:text-emerald-900 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                        Cambiar rol
                    </a>
                @endif
            </div>
        </div>
    </x-slot>

    <div class="space-y-7">
        @canany(['crear-productos', 'crear-categorias', 'crear-clientes', 'crear-proveedores', 'crear-ventas', 'crear-compras'])
            <section aria-labelledby="quick-actions-title">
                <div class="mb-3">
                    <h3 id="quick-actions-title" class="text-base font-bold text-slate-900">Accesos rápidos</h3>
                    <p class="mt-1 text-sm text-slate-500">Atajos a las tareas que puedes realizar.</p>
                </div>
                <div class="grid grid-cols-1 gap-3 sm:grid-cols-2 xl:grid-cols-3">
                    @can('crear-productos')
                        <a href="{{ route('products.create') }}" class="group rounded-xl border border-slate-200 bg-white p-4 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                            <span class="text-sm font-bold text-slate-900 group-hover:text-emerald-900">Nuevo producto</span>
                            <span class="mt-1 block text-xs text-slate-500">Agregar un producto al inventario.</span>
                        </a>
                    @endcan
                    @can('crear-categorias')
                        <a href="{{ route('categories.create') }}" class="group rounded-xl border border-slate-200 bg-white p-4 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                            <span class="text-sm font-bold text-slate-900 group-hover:text-emerald-900">Nueva categoría</span>
                            <span class="mt-1 block text-xs text-slate-500">Organizar el catálogo de productos.</span>
                        </a>
                    @endcan
                    @can('crear-clientes')
                        <a href="{{ route('clients.create') }}" class="group rounded-xl border border-slate-200 bg-white p-4 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                            <span class="text-sm font-bold text-slate-900 group-hover:text-emerald-900">Nuevo cliente</span>
                            <span class="mt-1 block text-xs text-slate-500">Registrar un cliente para tus ventas.</span>
                        </a>
                    @endcan
                    @can('crear-proveedores')
                        <a href="{{ route('providers.create') }}" class="group rounded-xl border border-slate-200 bg-white p-4 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                            <span class="text-sm font-bold text-slate-900 group-hover:text-emerald-900">Nuevo proveedor</span>
                            <span class="mt-1 block text-xs text-slate-500">Registrar un proveedor del negocio.</span>
                        </a>
                    @endcan
                    @can('crear-ventas')
                        <a href="{{ route('sales.create') }}" class="group rounded-xl border border-slate-200 bg-white p-4 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                            <span class="text-sm font-bold text-slate-900 group-hover:text-emerald-900">Nueva venta</span>
                            <span class="mt-1 block text-xs text-slate-500">Crear una venta y actualizar el stock.</span>
                        </a>
                    @endcan
                    @can('crear-compras')
                        <a href="{{ route('purchases.create') }}" class="group rounded-xl border border-slate-200 bg-white p-4 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                            <span class="text-sm font-bold text-slate-900 group-hover:text-emerald-900">Nueva orden de compra</span>
                            <span class="mt-1 block text-xs text-slate-500">Solicitar mercancía para reabastecer.</span>
                        </a>
                    @endcan
                </div>
            </section>
        @endcanany

        @if ($stats->isNotEmpty())
            <section aria-label="Indicadores">
                <div class="mb-3">
                    <h3 class="text-base font-bold text-slate-900">Indicadores</h3>
                    <p class="mt-1 text-sm text-slate-500">Datos disponibles para tu rol.</p>
                </div>
                <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 xl:grid-cols-4">
                    @foreach ($stats as $stat)
                        <article class="rounded-xl border border-slate-200 border-l-4 border-l-emerald-700 bg-white p-5 shadow-sm">
                            <p class="text-xs font-semibold uppercase tracking-wide text-slate-500">{{ $stat['label'] }}</p>
                            <p class="mt-2 break-words text-2xl font-bold tracking-tight text-slate-900">{{ $stat['value'] }}</p>
                        </article>
                    @endforeach
                </div>
            </section>
        @endif

        <div class="grid grid-cols-1 gap-5 xl:grid-cols-2">
            @canany(['ver-reportes', 'ver-ventas'])
                <section class="cotec-panel min-w-0 p-5 sm:p-6" aria-labelledby="top-products-title">
                    <div class="mb-4">
                        <h3 id="top-products-title" class="text-base font-bold text-slate-900">Productos más vendidos</h3>
                        <p class="mt-1 text-sm text-slate-500">Unidades vendidas este mes.</p>
                    </div>
                    @if ($topProducts->isNotEmpty())
                        <div class="overflow-x-auto">
                            <table>
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Producto</th>
                                        <th class="text-right">Unidades</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($topProducts as $i => $item)
                                        <tr>
                                            <td>{{ $i + 1 }}</td>
                                            <td class="font-semibold text-slate-900">{{ $item->product?->nombre ?? 'Producto eliminado' }}</td>
                                            <td class="text-right font-semibold">{{ $item->total_sold }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <p class="rounded-lg bg-slate-50 px-4 py-6 text-center text-sm text-slate-500">Aún no hay ventas registradas este mes.</p>
                    @endif
                </section>
            @endcanany

            @can('crear-compras')
                <section class="cotec-panel min-w-0 p-5 sm:p-6" aria-labelledby="low-stock-title">
                    <div class="mb-4 flex flex-wrap items-start justify-between gap-3">
                        <div>
                            <h3 id="low-stock-title" class="text-base font-bold text-slate-900">Reabastecimiento</h3>
                            <p class="mt-1 text-sm text-slate-500">Productos con cinco unidades o menos.</p>
                        </div>
                        <a href="{{ route('purchases.create') }}" class="text-sm font-semibold text-emerald-800 underline decoration-emerald-300 underline-offset-4 hover:text-emerald-950">
                            Crear orden
                        </a>
                    </div>
                    @if ($lowStock->isNotEmpty())
                        <div class="overflow-x-auto">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Producto</th>
                                        <th class="text-right">Stock</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($lowStock as $product)
                                        <tr>
                                            <td class="font-semibold text-slate-900">{{ $product->nombre }}</td>
                                            <td class="text-right">
                                                <span class="inline-flex min-w-8 justify-center rounded-full px-2 py-1 text-xs font-bold {{ $product->stock === 0 ? 'bg-red-100 text-red-800' : 'bg-amber-100 text-amber-800' }}">
                                                    {{ $product->stock }}
                                                </span>
                                            </td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    @else
                        <p class="rounded-lg bg-emerald-50 px-4 py-6 text-center text-sm font-medium text-emerald-900">No hay productos que requieran reabastecimiento.</p>
                    @endif
                </section>
            @endcan
        </div>

        <section aria-labelledby="modules-title">
            <div class="mb-3">
                <h3 id="modules-title" class="text-base font-bold text-slate-900">Tus módulos</h3>
                <p class="mt-1 text-sm text-slate-500">Accesos disponibles según tus permisos.</p>
            </div>
            <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 xl:grid-cols-3">
                @forelse ($modules as $module)
                    <a href="{{ route($module['route']) }}" class="group rounded-xl border border-slate-200 bg-white p-5 shadow-sm transition hover:-translate-y-0.5 hover:border-emerald-300 hover:shadow-md focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-700">
                        <span class="flex items-center justify-between gap-3">
                            <span class="font-bold text-slate-900 group-hover:text-emerald-900">{{ $module['title'] }}</span>
                            <span class="text-lg text-emerald-800 transition-transform group-hover:translate-x-1" aria-hidden="true">→</span>
                        </span>
                        <span class="mt-2 block text-sm leading-6 text-slate-500">{{ $module['description'] }}</span>
                    </a>
                @empty
                    <div class="col-span-full rounded-xl border border-dashed border-slate-300 bg-white p-8 text-center">
                        <p class="font-semibold text-slate-900">No tienes módulos disponibles.</p>
                        <p class="mt-1 text-sm text-slate-600">Pide a un administrador que te asigne un rol.</p>
                    </div>
                @endforelse
            </div>
        </section>
    </div>
</x-app-layout>
