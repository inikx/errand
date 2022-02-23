const redis = require("redis");
require("dotenv").config();
const config = process.env;
const client = redis.createClient({
    host: config.REDIS_HOST,
    port: config.REDIS_PORT,
    password: config.REDIS_PASSWORD,
});

const { promisify } = require("util");
const setAsyncEx = promisify(client.setex).bind(client);
const getAsync = promisify(client.get).bind(client);
const delAsync = promisify(client.del).bind(client);

client.on("error", (err) => {
    console.log("Error " + err);
});

async function saveWithTtl(key, value, ttlSeconds = 60) {
    return await setAsyncEx(key, ttlSeconds, JSON.stringify(value));
}

async function get(key) {
    const jsonString = await getAsync(key);

    if (jsonString) {
        return JSON.parse(jsonString);
    }
}
async function del(key) {
    await delAsync(key);
}

module.exports = {
    saveWithTtl,
    get,
    del
};