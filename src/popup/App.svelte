<script lang="ts">
  import PocketBase from "pocketbase";
  const pb = new PocketBase("YOUR_POCKETBASE_INSTANCE");
  async function handleLoginAuth() {
    const authStore = await pb.collection("users").authWithOAuth2({
      provider: "google"
    });
    console.log("🚀 ~ file: App.svelte:11 ~ authStore ~ authStore:", authStore);
  }
</script>

<main class="extension">
  {#if !pb.authStore.isValid}
  <h2>You are not logged in, please login to continue using this extension</h2>
  <button class="login-button" on:click={handleLoginAuth}>Login</button>
  {:else} 
  <h2> You are logged in as {pb.authStore.model.id}</h2>
  {/if}
</main>

<style>
  img {
    height: 5rem;
  }

  .extension {
    display: flex;
    flex-direction: column;
    gap: 4rem;
    margin: 2rem;
  }

  .login-button {
    background-color: blanchedalmond;
    height: 2rem;
    border-radius: 1rem;
  }

  .login-button:hover {
    background-color: black;
    color: white;
  }
</style>
