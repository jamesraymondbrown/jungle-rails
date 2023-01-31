context('Add to cart', () => {
  beforeEach(() => {
  })

  it('visits the home page', () => {
    cy.visit('/', { timeout: 500000 })
    cy.get('nav').should('exist')
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("clicks 'add to cart' on a product", () => {
    cy.get(".add-to-cart").first().click({ force: true });
  });

  it('verifies that the cart value has increased by 1', () => {
    cy.contains("My Cart (1)")
  })

})