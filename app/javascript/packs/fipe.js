document.addEventListener("turbolinks:load", function () {
    $('#vehicle_brand_id').on('change', function () {
        $.ajax({
            url: "/models",
            type: "GET",
            dataType: "json",
            data: {brand_id: $('#vehicle_brand_id option:selected').val()},
            success: function(data) {
                $("#vehicle_brand").val($("#vehicle_brand_id option:selected").text())
                $("#vehicle_model").find('option').remove().end();
                $("#vehicle_model").append(`<option value=></option>`);
                data.forEach(function(model) {
                    $("#vehicle_model").append(`<option value="${model["name"]}">${model["name"]}</option>`);
                })
            },
        })
    });

    $('#vehicle_model').on('change', function () {
        $('#vehicle_model_hidden').val($("#vehicle_model option:selected").val())
    });
})
