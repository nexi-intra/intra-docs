import React from "react";
import clsx from "clsx";
import Link from "@docusaurus/Link";
import useDocusaurusContext from "@docusaurus/useDocusaurusContext";
import Layout from "@theme/Layout";
import HomepageFeatures from "@site/src/components/HomepageFeatures";

import styles from "./index.module.css";

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={clsx("hero hero--primary", styles.heroBanner)}>
      <div className="container">
        <h1 className="hero__title">Master Your Digital Workspace</h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg"
            to="/docs/koksmat/ui/"
          >
            Get started in 5min ⏱️
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home(): JSX.Element {
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      title={`Master Your Digital Workspace`}
      description="Break free from the Microsoft 365 mold and craft tailored, powerful solutions that truly fit your needs. Simplify complexity, automate smarter, and build systems that stand strong on their own."
    >
      <HomepageHeader />
      <main>
        <HomepageFeatures />
        <section>
          <div className="container"></div>
        </section>
      </main>
    </Layout>
  );
}
