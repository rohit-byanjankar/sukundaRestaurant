<!-- The Modal -->
<div class="modal" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title text-center">Announcement!
                    <button type="button" class="btn btn-danger pull-right" data-dismiss="modal">&times;</button>
                </h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
                    {!! $modal[0]->content !!}
            </div>
        </div>
    </div>
</div>

@push('scripts')
    <script type="text/javascript">
        $(window).on('load',function(){
            $('#myModal').modal('show');
        });
    </script>
@endpush