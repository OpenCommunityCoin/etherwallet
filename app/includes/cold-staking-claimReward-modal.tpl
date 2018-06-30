<article class="modal fade" id="openClaimRewardModal" tabindex="-1"
>
    <section class="modal-dialog">
        <form ng-submit="claim()">
            <section class="modal-content"
                     ng-if="['RINKEBY ETH', 'Testnet CLO'].includes(ajaxReq.type)"

            >

                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>

                    <div class="alert alert-danger" ng-if="coldStakingService.contract.staker_info.reward === 0">
                        <h1>WARNING!</h1>
                        <p translate="COLD_STAKING_NO_WITHDRAW">
                            You do not have any deposit to withdraw.
                        </p>
                    </div>


                    <h2 class="modal-title">You are about to claim <b> Reward
                        {{coldStakingService.contract.stake_balance || 0}}
                        {{ajaxReq.type}}</b>
                    </h2>

                    <h5>
                        You will claim reward from the cold staking contract:
                        <a
                                target="_blank"
                                href="{{ajaxReq.blockExplorerAddr.replace('[[address]]', coldStakingService.contract.address)}}"
                        >
                            {{coldStakingService.contract.address}}
                        </a>

                    </h5>

                    <p>
                        <b translate="TRANS_gas"></b>

                        {{tx.gasLimit || '-1'}}
                    </p>

                    <p>
                        <b>Warning:</b> After claiming the reward, your funds will be frozen for the next 172,800 blocks

                        (approx. 1 month) and you will be unable to claim new reward OR withdraw your funds during this
                        period.
                    </p>


                    <b>Warning:</b> Staking reward can vary over time. Your staking reward depend on:
                    <ol>
                        <li>
                            Total amount of staking {{ajaxReq.type}} (network weight)
                        </li>
                        <li>
                            Your staking time
                        </li>
                        <li>
                            Other staker's claims
                        </li>
                        <li>
                            Available staking pool
                        </li>
                    </ol>
                    <h4 translate="SENDModal_Content_3">Are you sure you want to do this?</h4>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-default" data-dismiss="modal" translate="SENDModal_No">
                        No, get me out of here!
                    </button>
                    <button
                            ng-disabled="coldStakingService.contract.staker_info.reward === 0;"

                            type="submit"
                            class="btn btn-primary" translate="SENDModal_Yes">
                        Yes, I am sure! Make transaction.
                    </button>
                </div>
            </section>
        </form>
    </section>
</article>
