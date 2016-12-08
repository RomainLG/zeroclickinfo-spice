(function (env) {
    "use strict";
    env.ddg_spice_randomcat = function(api_result){

        // Validate the response (customize for your Spice)
        if (!api_result || api_result.error) {
            return Spice.failed('randomcat');
        }

        // Render the response
        Spice.add({
            id: "randomcat",

            // Customize these properties
            name: "AnswerBar title",
            data: api_result,
            meta: {
                sourceName: "a random cat",
                sourceUrl: 'http://example.com/url/to/details/' + api_result.name
            },
            normalize: function(item) {
                return {
                    // customize as needed for your chosen template
                   // title: item.title,
                    //subtitle: item.subtitle,
                    image: item.response.data.images.image.url.text
                };
            },
            templates: {
                group: 'icon',
                options: {
                   // content: Spice.randomcat.content,
                    moreAt: true
                }
            }
        });
    };
}(this));
