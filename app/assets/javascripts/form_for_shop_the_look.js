$(document).ready(function() {
  $(document).on('page:change', function () {

    if (!Array.prototype.last){
      Array.prototype.last = function(){
          return this[this.length - 1];
      };
    };

    womensLookCategories = {'Accessories': ['Lingerie & Underwear', 'Hats', 'Bags & Purses', 'Jewellery', 'Other'], 'Dresses': ['Day Dresses', 'Evening Dresses'], 'Jeans Trousers & Leggings': ['Jeans', 'Trousers','Leggings'], 'Home & Lifestyle': ['Home & Living'], 'Shoes': ['Boots', 'Trainers', 'Heels', 'Flats'], 'Shorts & Skirts': ['Shorts', 'Skirts'], 'Sunglasses & Watches': ['Sunglasses', 'Watches'], 'Swim & Beachwear': ['Bikinis', 'Swimsuits', 'Other'], 'Tops': ['T-Shirts & Vests', 'Shirts & Blouses', 'Hoodies & Sweatshirts', 'Jackets & Coats'] };

    mensLookCategories = {'Accessories': ['Hats', 'Bags', 'Jewellery', 'Other'], 'Formal': ['Jackets & Coats','Suits', 'Accessories'], 'Lifestyle': ['Lifestyle'], 'Longs': ['Jeans', 'Chinos', 'Joggers'], 'Shoes': ['Boat & Loafers', 'Boots', 'Trainers', 'Formal', 'Other'], 'Shorts & Swimwear': ['Shorts', 'Swimwear'], 'Sunglasses & Watches': ['Sunglasses', 'Watches'] , 'Tops': ['T-Shirts & Polos', 'Shirts', 'Hoodies & Sweatshirts', 'Jackets & Coats'] };

    function categories(className, itemCategories){
      $("." + className).children().remove()
      $.each( itemCategories, function( key, value ) {
        $("." + className).append("<option value=" + key + ">"  +  key + "</option>");
      });
    }

    $(".gender-look, .cat-look").change(function(){
      // genderValue = $(".gender-look").val()
      var classList = $(this).prop("classList")
      var classNumber = classList[classList.length-1].split("-").last()
      var findCatClass = 'new-item-look-category-' + classNumber
      var findSubCatClass = 'new-item-look-sub-category-' + classNumber
      console.log($(this).val())
      if ($(this).val() === 'Mens') {
        categories(findCatClass, mensLookCategories)
        subLookCat(findCatClass, findSubCatClass, mensLookCategories)
      }else if ($(this).val() == 'Womens') {
        categories(findCatClass, womensLookCategories)
        subLookCat(findCatClass, findSubCatClass, womensLookCategories)
      }
    });

    function subLookCat(findCatClass, findSubCatClass, cat){
      $("." + findSubCatClass).children().remove()
        $.each( cat, function( key, value ) {
          if (key.includes($("." + findCatClass).val())){
            var subCategory = value;
            $.each( subCategory, function( index, subCatValues ) {
              $("." + findSubCatClass).append("<option value=" + subCatValues + ">" + subCatValues + "</option>");
            });
          }
        });
      }
    // $(".gender-look, .cat-look").change(function(){
    //   var classList = $(this).prop("classList")
    //   var classNumber = classList[classList.length-1].split("-").last()
    //   var findSubCatClass = 'new-item-look-sub-category-' + classNumber
    //   var findCatClass = 'new-item-look-category-' + classNumber
    //   // $("." + findSubCatClass).children().remove()
    //   // $.each( mensLookCategories, function( key, value ) {
    //   //   if (key.includes($("." + findCatClass).val())){
    //   //     var subCategory = value;
    //   //     $.each( subCategory, function( index, subCatValues ) {
    //   //       $("." + findSubCatClass).append("<option value=" + subCatValues + ">" + subCatValues + "</option>");
    //   //     });
    //   //   }
    //   // });
    // })


    //item on sale id changes

    // $("#item-on-sale").change(function(){
    //   if ($("#item-on-sale").val() === 'true' ) {
    //     $('#item-sale-price').show();
    //     //show the sale price form
    //   } else if ($("#item-on-sale").val() === 'false' ) {
    //     $('#item-sale-price').hide();
    //   }
    //   //else hide it
    // });

    //hide it at the beginning of page
    // if ($("#item-on-sale").val() === 'false' ) {
    //   $('#item-sale-price').hide();
    // }

  });
});
