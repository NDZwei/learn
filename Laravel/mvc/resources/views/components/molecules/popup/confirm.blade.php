@props(['open', 'title', 'textConfirm', 'textClose', 'text', 'onClose', 'onConfirm', 'isNotAPromise'])

<div class="modal" tabindex="-1" role="dialog" style="{{ $open ? '' : 'display: none;' }}">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ $title }}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close" @click="{{ $onClose }}">
                    <span aria-hidden="true">{{ $textClose }}</span>
                </button>
            </div>
            <div class="modal-body">
                <p>{{ $text }}</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" @click="{{ $onClose }}">{{ $textClose }}</button>
                <button type="button" class="btn btn-primary" @click="{{ $onConfirm }}">{{ $textConfirm }}</button>
            </div>
        </div>
    </div>
</div>
