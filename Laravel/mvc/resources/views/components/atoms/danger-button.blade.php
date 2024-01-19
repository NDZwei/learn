@props(['type','onclick', 'data_modal_target', 'data_modal_toggle', 'data_modal_hide', 'slot'])

<button type="{{ $type ?? 'button' }}"
    @isset($id)
        id="{{ $id }}"
    @endisset
    @isset($onclick)
        onclick="{{ $onclick }}"
    @endisset
    @isset($data_modal_target)
        data-modal-target="{{ $data_modal_target }}"
    @endisset
    @isset($data_modal_toggle)
        data-modal-toggle="{{ $data_modal_toggle }}"
    @endisset
    @isset($data_modal_hide)
        data-modal-hide="{{ $data_modal_hide }}"
    @endisset
    {{ $attributes->merge(['class' => 'px-3 py-2 mx-1 h-9 items-center text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center text-center']) }} >
    {{ $slot ?? '' }}
</button>
