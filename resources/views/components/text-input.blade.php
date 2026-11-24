@props(['disabled' => false])

<input @disabled($disabled) {{ $attributes->merge(['class' => 'rounded-lg border-slate-300 bg-white text-slate-900 placeholder:text-slate-400 shadow-sm transition focus:border-emerald-700 focus:ring-emerald-700 disabled:cursor-not-allowed disabled:bg-slate-50 disabled:text-slate-500']) }}>
