/** @type {import('next').NextConfig} */
const isStaticExport = process.env.STATIC_EXPORT === "1";

const nextConfig = {
  reactStrictMode: true,
  images: { unoptimized: true },
  // عند التصدير الثابت (Netlify Drop / Cloudflare Pages / GitHub Pages)
  ...(isStaticExport
    ? { output: "export", trailingSlash: true }
    : {}),
};

export default nextConfig;
