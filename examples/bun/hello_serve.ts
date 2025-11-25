const server = Bun.serve({
	routes: {
		"*": new Response("Hello from Bun.serve\n"),
	},
});

console.log(`Server running at ${server.url}`);
