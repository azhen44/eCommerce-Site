describe('Jungle Product Page Tests', () => {
  beforeEach(() => {
        cy.visit('localhost:3000')
  })

  it('displays Welcome to The Jungle', () => {
    cy.get('.hero').contains("Welcome to The Jungle")
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Clicks into a product", () => {
    cy.get("img").first().click();
    cy.url().should('contain', '/products/')
  })
 
})
