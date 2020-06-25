import React from "react";
import { Link } from "react-router-dom";
import {Container, Image, Row, Col} from 'react-bootstrap/'
import Typewriter from './typewriter'
import Navbar from 'react-bootstrap/Navbar'
import Signup from './Signup'
import Photo from '../../assets/images/lecturephoto.png'
import Nav from 'react-bootstrap/Nav'
import Button from 'react-bootstrap/Button'
export default () => (
  <div className="primary-color align-items-center justify-content-center">
    <Container fluid="true">
  <Navbar bg="dark" expand="lg" variant="dark">
    <Navbar.Brand href="#home">Couse Alert</Navbar.Brand>
    <Nav className="mr-auto">
      <Nav.Link href="#about">About Us</Nav.Link>
      <Nav.Link href="#stats">Stats</Nav.Link>
      <Nav.Link href="#courses">My Courses</Nav.Link>
    </Nav>
  </Navbar>
  <Row>
    <Col><Typewriter>Helo</Typewriter></Col>
  </Row>
  <Row><Image src={Photo} ></Image></Row>
  {/* <Row><Button variant="primary" size="lg">
      Register Now
    </Button>
    </Row> */}
    <Signup>sdfsd</Signup>

  {/* <Row><Signup>Lol</Signup></Row> */}
</Container>


  </div>
);
