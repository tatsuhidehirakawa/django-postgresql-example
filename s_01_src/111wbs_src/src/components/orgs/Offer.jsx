import React from "react"
/** @jsxImportSource @emotion/react */
import { css } from "@emotion/react";
// import "./Offer.scss"
import Rating from '@mui/material/Rating';
import 'leaflet/dist/leaflet.css';
import { MapB } from "../atms/Map";
import { Link } from "react-router-dom";
// import Pic from "../atms/Pic";
// import { useQuery } from 'react-query';

// import Avater from '@mui/material/Avater';

// import ApiFetch from '../../hooks/ApiFestch.jsx';

const outline = css`
  width: 900px;
  height: 970px;
  display:flex;
  flex-flow: column;
  background-color: white;
  margin: 0px auto;
  border-radius: 15px;
  filter: drop-shadow(9px 13px 7px rgba(0, 0, 0, 0.2));
`;

const inlineA = css`
  display: flex;
  height: 33%;
  width: 100%;
  // background-color: gray;
`;

const boxA = css`
  height: 100%;
  width: 33%;
  background-color: #e9dfe5;
  transform: translate(-39px, -33px);
  border-radius: 15px 15px 15px 15px;
  filter: drop-shadow(9px 13px 7px rgba(0, 0, 0, 0.2));
`;

const boxB = css`
  height: 100%;
  width: 70%;
  // background-color: blue;
  // border-radius: 0px 15px 0px 0px;
  text-align: left;
  padding: 15px 20px 15px 20px;
  // filter: drop-shadow(9px 13px 7px rgba(0, 0, 0, 0.2));
`;

const inlineB = css`
  height: 34%;
  width: 100%;
  background-color: #eaf4fc;
`;

const inlineC = css`
  height: 33%;
  width: 100%;
  // border-radius: 0px 0px 15px 15px;
  // background-color: yellow;
`;

const boxC = css`
  height: 100%;
  width: 63%;
`;

const boxD = css`
  height: 100%;
  width: 37%;
  z-index: 10;
  // border-radius: 15px 15px 15px 15px;
  transform: translate(567px, -320px);
`;

// const fetchUsers = async () => {
//   const res = await fetch('http://localhost:8080/accountAttribute/someGet');
//   return res.json();
// };

const Offer = () => {

  // const { data,isLoading } = useQuery('users', fetchUsers);

  // if (isLoading) {
  //   return <span>Loading...</span>;
  // }

  return (
    <div className="Offer--outline" css={outline}>
      <div className="Offer--inlineA" css={inlineA}>
        <div className="Offer--inlineA--boxA__pictureA" css={boxA}>
          {/* {data.user => {
            return (
              <Pic image={user.rate.String} />
            );
          }} */}
        </div>
        <div className="Offer--inlineA--boxB__textA" css={boxB}>
          <Rating />
          <p>えー、で、あるからしてですね、えー、わたくしわぁ、皆さんのぉ、
            お役に立ちたいなと日ごろからそう思っているわけでして、つまるところですなぁ、
            「お役に立ちたい」と、こう思う主体と、「お役に立たれたい」と思うあなた方という
            客体とがあって、初めてお役に立つことができると、こう思っているわけであります。
            「お役に立つ」とは            どういうことかと申しますと、</p>
        </div>
      </div>
      <div className="Offer--inlineB" css={inlineB}>
        <p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>
      </div>
      <div className="Offer--inlineC__pictureA" css={inlineC}>
        <div className="Offer--inlineC--boxC__introduction" css={boxC}>
        </div>
        <div className="Offer--inlineC--boxD__map" css={boxD}>
          <Link to="/Coordinate"><MapB /></Link>
        </div>
      </div>
    </div>
  )
}

export default Offer;


// <div className="Offer--inlineB--boxA__pictureA" css={map}>
// </div>
// <div className="Offer--inlineB--boxB__textA" css={map}>
// </div>
