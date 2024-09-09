const update_area = function() {
    db.phones.find().forEach(
        function(phone) {
            phone.components.area++;
            phone.display = "+"+
            phone.components.country+" "+
            phone.components.number;
            db.phone.updateOne({_id: phone._id}, 
                {$set: {display: phone.display, 'components.area': phone.components.area}}
            );
        });
}