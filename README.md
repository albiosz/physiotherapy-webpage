# 🥼 Physiotherapy Webpage
A webpage for my father's physiotherapy practice.

The webpage is live at [hubertszulc.eu](https://hubertszulc.eu/).

## 🎯 Goals
- **Simple & clear** design on both mobile and desktop
- **Easy access** to key information (telephone number, address, etc.)
- **Modular & easily adjustable** content
- **Automatic** deployment
- **Fast** loading

## 🚀 How to Run Locally?

### Prerequisites
- **node.js v20.13.1** or higher

### Steps
1. Clone the repository.
2. `cd physiotherapy-webpage`
3. `npm install`
4. `npm run dev`
5. The webpage should automatically open in the browser (default: `localhost:3000`)

### Deployment Features:
- SCSS is automatically compiled to CSS
- Live reloading on file changes

# 🛠️ Tech Stack
- **SCSS** - Modular structure for style files
- **Bootstrap** - Responsive Design
- **Mustache.js** - Template system to eliminate redundant HTML
- **GitHub Actions** - Automates deployment via SSH to a VServer on every commit
- **Nginx** - Serving static files
