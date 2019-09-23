@component('mail::layout')
    {{-- Header --}}
    @slot('header')
        @component('mail::header', ['url' => config('app.url')])
            {{ setting('site.title') }}
        @endcomponent
    @endslot

    {{-- Body --}}
{{--    {{ $slot }}--}}


    {{-- Subcopy --}}
    @isset($subcopy)
        @slot('subcopy')
            @component('mail::subcopy')
                {{ $subcopy }}
            @endcomponent
        @endslot
    @endisset

    @component('mail::table')
        {{ $slot }}
    @endcomponent

    {{-- Footer --}}
    @slot('footer')
        @component('mail::footer')
            © {{ date('Y') }} {{ setting('site.title')}}. @lang('All rights reserved.')
        @endcomponent
    @endslot
@endcomponent
