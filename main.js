const Apify = require('apify');

Apify.main(async () => {
    // Fetch the input of the actor.
    // If you're using INPUT_SCHEMA.json, the input is automatically checked for you.
    const input = await Apify.getValue('INPUT');
    if (!input || !input.message) {
        console.dir(input);
        throw new Error('No message provided on the INPUT!');
    }

    // Here's the place for your magic...
    console.log(`Input message: ${input ? input.message : 'N/A'}`);

    // Store the output
    const output = {
        message: `${input.message} Hello my friend!`
    };
    await Apify.setValue('OUTPUT', output)
});
