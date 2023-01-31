/// <reference types="cypress" />

context('Home page', () => {
  beforeEach(() => {
    
  })


  it('visits the home page', () => {
    // https://on.cypress.io/type
    cy.visit('/', { timeout: 500000 })
    cy.get('nav').should('exist')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

})
