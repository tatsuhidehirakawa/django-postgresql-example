/** @jsxImportSource @emotion/react */
import { css } from "@emotion/react";
import React from "react"
import { Mapper } from "../atms/Mapper";
import Saver from  '../mlcs/Saver.jsx';
import ModeSelectPanel from  '../atms/ModeSelectPanel.jsx';
import AnnunciatorPanel from  '../atms/AnnunciatorPanel.jsx';
import "../../Pager.scss";

const outline = css`
  position: absolute;
  width: 100%;
  height 1500px;
  z-index: 3;
`;

const Coordinate = () => {

  return (
    <div className="coodinate--outline" css={outline}>
      <ModeSelectPanel />
      <Saver className="contents_box"/>
      {/* <Saver /> */}
      <AnnunciatorPanel />
      <Mapper />
      {/* <Saver className="z-6" /> */}
      {/* <Savee className="z-5" /> */}
      {/* <Mapper className="z-2" /> */}
    </div>
  )
}

export default Coordinate;
