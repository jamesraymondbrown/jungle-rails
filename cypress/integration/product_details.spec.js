context('Product Page', () => {
  beforeEach(() => {
  })

  it('Visits the home page', () => {
    // https://on.cypress.io/type
    cy.visit('/', { timeout: 500000 })
    cy.get('nav').should('exist')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Clicks on a product", () => {
    cy.contains("Scented Blade").click();
  });

  it('Navigates to a new page when the product is clicked', () => {
    cy.contains("The Scented Blade is an extremely rare")
  })
})