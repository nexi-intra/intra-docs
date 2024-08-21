import React from "react";
import clsx from "clsx";
import styles from "./styles.module.css";
// import img1 =from "@site/static/Step1.png"
// import img2 from "@site/static/img/Step2.png"
// import img3 from "@site/static/img/Step3.png"
const img1 = require("@site/static/img/Step1.png").default;
const img2 = require("@site/static/img/Step2.png").default;
const img3 = require("@site/static/img/Step3.png").default;

type FeatureItem = {
  title: string;
  img: string;
  description: JSX.Element;
};

const FeatureList: FeatureItem[] = [
  {
    title: "Streamlining Microsoft 365 Complexity",
    img: img1,
    description: (
      <>
        The more complicated you make it, the harder it will be to control. My
        mission is to simplify Microsoft 365 by focusing on its core
        elements—Exchange Online, SharePoint Online, and Azure Active
        Directory—while empowering you to build tailored, maintainable
        solutions.
      </>
    ),
  },
  {
    title: "Empowering DevAdmins with Automation",
    img: img2,
    description: (
      <>
        Automate your Microsoft 365 environment using the tools and scripts that
        matter. Say goodbye to unnecessary complexity with Power Apps and Power
        Automate, and instead leverage PowerShell and SharePoint Lists where
        they truly make a difference.
      </>
    ),
  },
  {
    title: "Building Robust, Self-Sufficient Systems ",
    img: img3,
    description: (
      <>
        Forget the one-size-fits-all approach. By understanding the strengths
        and limitations of Microsoft 365, you can build systems that are not
        only powerful but also self-sufficient, reducing your reliance on
        out-of-the-box solutions.
      </>
    ),
  },
];

function Feature({ title, img, description }: FeatureItem) {
  return (
    <div className={clsx("col col--4")}>
      <div className="text--center">
        <img className={styles.featureSvg} src={img}></img>
        {/* <Svg className={styles.featureSvg} role="img" /> */}
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): JSX.Element {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
