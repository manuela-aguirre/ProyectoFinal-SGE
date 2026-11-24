<button {{ $attributes->merge(['type' => 'submit', 'class' => 'inline-flex items-center justify-center rounded-lg border border-transparent bg-[#14532d] px-4 py-2.5 text-sm font-semibold text-white shadow-sm transition hover:bg-[#166534] focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-[#14532d] active:bg-[#0f3f29] disabled:cursor-not-allowed disabled:opacity-50']) }}>
    {{ $slot }}
</button>
