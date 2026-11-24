<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'LYRA ERP') }}</title>

        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600,700,800&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwUEQp5WJb4JjY0pwW2B2Qz8KCA7vVqQxL5ZQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

        @vite(['resources/css/app.css', 'resources/js/app.js'])
        @include('partials.crud-styles')

        <style>
            :root {
                --cotec-green-900: #14532d;
                --cotec-green-50: #f0fdf4;
                --cotec-green-100: #dcfce7;
                --cotec-slate-900: #0f172a;
                --cotec-slate-500: #64748b;
                --cotec-border: rgba(20, 83, 45, 0.12);
            }

            body {
                font-family: 'Figtree', sans-serif;
                background: linear-gradient(180deg, #edf9f0 0%, #f8fafc 100%);
            }

            .cotec-topbar {
                position: sticky;
                top: 0;
                z-index: 40;
                border-bottom: 1px solid var(--cotec-border);
                background: rgba(255, 255, 255, 0.96);
                box-shadow: 0 4px 18px rgba(15, 23, 42, 0.04);
                backdrop-filter: blur(12px);
            }

            .cotec-topbar-inner {
                display: flex;
                flex-wrap: wrap;
                align-items: center;
                gap: 0.65rem 1.25rem;
                max-width: 1500px;
                margin: 0 auto;
                padding: 0.7rem 1rem;
            }

            .cotec-primary-nav {
                order: 3;
                display: flex;
                flex: 1 0 100%;
                flex-wrap: wrap;
                align-items: center;
                gap: 0.2rem;
                border-top: 1px solid #e2e8f0;
                padding-top: 0.55rem;
            }

            .cotec-topbar-actions {
                order: 2;
                display: flex;
                align-items: center;
                gap: 0.65rem;
                margin-left: auto;
            }

            .cotec-shell {
                max-width: 1500px;
                margin: 0 auto;
                padding: 1.5rem 1rem 2rem;
            }

            .cotec-content {
                min-width: 0;
            }

            .cotec-panel {
                background: white;
                border-radius: 1.2rem;
                border: 1px solid var(--cotec-border);
                box-shadow: 0 10px 25px rgba(15, 23, 42, 0.04);
            }

            .cotec-main {
                padding: 1rem 0 0;
            }

            .cotec-footer {
                margin-top: 1.5rem;
                background: #0f172a;
                color: rgba(255,255,255,0.82);
                border-top: 1px solid rgba(255,255,255,0.08);
            }

            .cotec-footer-inner {
                max-width: 1500px;
                margin: 0 auto;
                padding: 1.5rem 1rem;
                display: flex;
                justify-content: space-between;
                gap: 1rem;
                flex-wrap: wrap;
            }

            @media (min-width: 1024px) {
                .cotec-primary-nav {
                    order: 2;
                    flex: 1 1 0;
                    border-top: 0;
                    padding-top: 0;
                }

                .cotec-topbar-actions {
                    order: 3;
                }
            }
        </style>
    </head>
    <body class="font-sans antialiased">
        <div class="min-h-screen text-slate-800">
            @include('layouts.navigation')

            <div class="cotec-shell">
                <div class="cotec-content">
                    @isset($header)
                        <header class="cotec-panel bg-white shadow-sm">
                            <div class="max-w-7xl mx-auto py-5 px-5 sm:px-6 lg:px-8">
                                {{ $header }}
                            </div>
                        </header>
                    @endisset

                    <main class="cotec-main">
                        {{ $slot }}
                    </main>
                </div>
            </div>

            <footer class="cotec-footer">
                <div class="cotec-footer-inner">
                    <div>
                        <div class="mb-2 text-[0.7rem] uppercase tracking-[0.16em] opacity-70">Sistema</div>
                        <div>Versión 2.4.0</div>
                    </div>

                    <div>
                        <div class="mb-2 text-[0.7rem] uppercase tracking-[0.16em] opacity-70">Contacto</div>
                        <div>ventas@lyra.com</div>
                    </div>

                    <div>
                        <div class="mb-2 text-[0.7rem] uppercase tracking-[0.16em] opacity-70">© {{ date('Y') }}</div>
                        <div>Todos los derechos reservados</div>
                    </div>
                </div>
            </footer>
        </div>
        @stack('scripts')
    </body>
</html>
