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

### Local Development Features:
- SCSS is automatically compiled to CSS
- Live reloading on file changes

# Deployment
- **AWS** - S3 + Cloud Front (CDN)

1. Create the ssl certificate.
  - `tf apply -target=aws_acm_certificate.hubertszulc_eu`
  - it's necessary to do it first, since then the terraform knowns the values and number of DNS entries that needs to be included in hosted zone in route53
2. Create the rest of the infrastructure.
  - `tf apply`
  - **ATTENTION**: When the hosted zone in route53 is created, change the DNS server settings in home.pl!
    - before conduction the action, the ssl certificates cannot be verified (the DNS requests do not go to the created hosted zone!) 


# 🛠️ Tech Stack
- **SCSS** - Modular structure for style files
- **Bootstrap** - Responsive Design
- **Mustache.js** - Template system to eliminate redundant HTML
- **Terraform** - Defines the AWS deployment infrastructure
- **GitHub Actions** - Automates deployment to AWS S3 on every commit

