## WORK INPROGRESS...
This is a [Next.js](https://nextjs.org) project bootstrapped with [`create-next-app`](https://nextjs.org/docs/app/api-reference/cli/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/app/building-your-application/optimizing/fonts) to automatically optimize and load [Geist](https://vercel.com/font), a new font family for Vercel.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/app/building-your-application/deploying) for more details.

## Dockerfile

This project includes a Dockerfile for containerizing the application. The Dockerfile uses multistage builds to optimize the image size and improve security.

### Multistage Builds

Multistage builds allow you to use multiple `FROM` statements in your Dockerfile, each creating a new stage. This helps in keeping the final image small and secure by copying only the necessary artifacts from the build stages.

### Security Improvements

1. **Use a minimal base image**: Using `node:18-alpine` reduces the attack surface by including only the necessary components.
2. **Run as a non-root user**: Add a non-root user to avoid running the application as the root user.
3. **Copy only necessary files**: Use `.dockerignore` to exclude unnecessary files from the Docker build context.

Make sure to create a `.dockerignore` file to exclude unnecessary files:

