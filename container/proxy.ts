const SOCKET = Deno.env.get("SOCK");
const PORT = Deno.env.get("PORT");

if(!SOCKET || !PORT) {
    throw new Error("Missing port and socket env vars")
}

const worker = new Worker(new URL("./app/index.js", import.meta.url), {
    deno: {
        permissions: 'inherit'
    },
    name: 'server',
    type: 'module'
})

worker.onerror = (e: ErrorEvent) => {
    throw new Error(e.message)
}

Deno.serve({ path: SOCKET }, async (req) => {
    return await fetch(`http://localhost:${PORT}`, req)
})