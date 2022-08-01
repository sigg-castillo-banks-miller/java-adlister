<div class="modal fade" id="editModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="editModal">
    <form action="/ads/edit" method="post">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ads" style="margin-left: auto">Edit Ad</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="ad-title" class="col-form-label">Edit title:</label>
                        <input type="text" class="form-control m-0" id="ad-title" name="title"
                               value="${sessionScope.ads.title}">
                    </div>
                    <div class="mb-3">
                        <label for="ads-description" class="col-form-label">Edit description:</label>
                        <input type="text" class="form-control" id="ads-description" name="description"
                               value="${sessionScope.ads.description}">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" id="ads-save-btn" name='ad-id' value="save-btn" class="btn btn-primary">
                        Save Changes
                    </button>
                </div>
            </div>
        </div>
    </form>
</div>
