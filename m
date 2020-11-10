Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABCF2ADF4A
	for <lists+linux-audit@lfdr.de>; Tue, 10 Nov 2020 20:26:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-zybxpPODMXKKGHPp2Bwv7w-1; Tue, 10 Nov 2020 14:26:53 -0500
X-MC-Unique: zybxpPODMXKKGHPp2Bwv7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66435101872C;
	Tue, 10 Nov 2020 19:26:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0C11A340;
	Tue, 10 Nov 2020 19:26:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6927658103;
	Tue, 10 Nov 2020 19:26:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AAJQX1C023676 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 14:26:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C0FA4200AE6D; Tue, 10 Nov 2020 19:26:33 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC66D200A7DC
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 19:26:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63E701021F8D
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 19:26:31 +0000 (UTC)
Received: from namei.org (namei.org [65.99.196.166]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-238-ve0ypYj3NjmYF2ebdrEt0Q-1;
	Tue, 10 Nov 2020 14:26:28 -0500
X-MC-Unique: ve0ypYj3NjmYF2ebdrEt0Q-1
Received: from localhost (localhost [127.0.0.1])
	by namei.org (8.14.4/8.14.4) with ESMTP id 0AAJQCLt001815;
	Tue, 10 Nov 2020 19:26:12 GMT
Date: Wed, 11 Nov 2020 06:26:12 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH v22 16/23] LSM: security_secid_to_secctx in netlink
	netfilter
In-Reply-To: <20201110133715.GA1890@salvia>
Message-ID: <alpine.LRH.2.21.2011110626050.32313@namei.org>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
	<20201105004924.11651-17-casey@schaufler-ca.com>
	<20201110133715.GA1890@salvia>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	casey.schaufler@intel.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org, sds@tycho.nsa.gov
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2020, Pablo Neira Ayuso wrote:

> Hi Casey,
> 
> On Wed, Nov 04, 2020 at 04:49:17PM -0800, Casey Schaufler wrote:
> > Change netlink netfilter interfaces to use lsmcontext
> > pointers, and remove scaffolding.
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Reviewed-by: John Johansen <john.johansen@canonical.com>
> > Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> > Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> > Cc: netdev@vger.kernel.org
> > Cc: netfilter-devel@vger.kernel.org
> 
> You can carry this tag in your follow up patches.
> 
> Acked-by: Pablo Neira Ayuso <pablo@netfilter.org>

Thanks for the review!

> 
> Thanks.
> 
> > ---
> >  net/netfilter/nfnetlink_queue.c | 37 +++++++++++++--------------------
> >  1 file changed, 14 insertions(+), 23 deletions(-)
> > 
> > diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> > index 84be5a49a157..0d8b83d84422 100644
> > --- a/net/netfilter/nfnetlink_queue.c
> > +++ b/net/netfilter/nfnetlink_queue.c
> > @@ -301,15 +301,13 @@ static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
> >  	return -1;
> >  }
> >  
> > -static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
> > +static void nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
> >  {
> > -	u32 seclen = 0;
> >  #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
> >  	struct lsmblob blob;
> > -	struct lsmcontext context = { };
> >  
> >  	if (!skb || !sk_fullsock(skb->sk))
> > -		return 0;
> > +		return;
> >  
> >  	read_lock_bh(&skb->sk->sk_callback_lock);
> >  
> > @@ -318,14 +316,12 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
> >  		 * blob. security_secid_to_secctx() will know which security
> >  		 * module to use to create the secctx.  */
> >  		lsmblob_init(&blob, skb->secmark);
> > -		security_secid_to_secctx(&blob, &context);
> > -		*secdata = context.context;
> > +		security_secid_to_secctx(&blob, context);
> >  	}
> >  
> >  	read_unlock_bh(&skb->sk->sk_callback_lock);
> > -	seclen = context.len;
> >  #endif
> > -	return seclen;
> > +	return;
> >  }
> >  
> >  static u32 nfqnl_get_bridge_size(struct nf_queue_entry *entry)
> > @@ -398,12 +394,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
> >  	struct net_device *indev;
> >  	struct net_device *outdev;
> >  	struct nf_conn *ct = NULL;
> > +	struct lsmcontext context = { };
> >  	enum ip_conntrack_info ctinfo;
> >  	struct nfnl_ct_hook *nfnl_ct;
> >  	bool csum_verify;
> > -	struct lsmcontext scaff; /* scaffolding */
> > -	char *secdata = NULL;
> > -	u32 seclen = 0;
> >  
> >  	size = nlmsg_total_size(sizeof(struct nfgenmsg))
> >  		+ nla_total_size(sizeof(struct nfqnl_msg_packet_hdr))
> > @@ -469,9 +463,9 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
> >  	}
> >  
> >  	if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
> > -		seclen = nfqnl_get_sk_secctx(entskb, &secdata);
> > -		if (seclen)
> > -			size += nla_total_size(seclen);
> > +		nfqnl_get_sk_secctx(entskb, &context);
> > +		if (context.len)
> > +			size += nla_total_size(context.len);
> >  	}
> >  
> >  	skb = alloc_skb(size, GFP_ATOMIC);
> > @@ -604,7 +598,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
> >  	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
> >  		goto nla_put_failure;
> >  
> > -	if (seclen && nla_put(skb, NFQA_SECCTX, seclen, secdata))
> > +	if (context.len &&
> > +	    nla_put(skb, NFQA_SECCTX, context.len, context.context))
> >  		goto nla_put_failure;
> >  
> >  	if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
> > @@ -632,10 +627,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
> >  	}
> >  
> >  	nlh->nlmsg_len = skb->len;
> > -	if (seclen) {
> > -		lsmcontext_init(&scaff, secdata, seclen, 0);
> > -		security_release_secctx(&scaff);
> > -	}
> > +	if (context.len)
> > +		security_release_secctx(&context);
> >  	return skb;
> >  
> >  nla_put_failure:
> > @@ -643,10 +636,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
> >  	kfree_skb(skb);
> >  	net_err_ratelimited("nf_queue: error creating packet message\n");
> >  nlmsg_failure:
> > -	if (seclen) {
> > -		lsmcontext_init(&scaff, secdata, seclen, 0);
> > -		security_release_secctx(&scaff);
> > -	}
> > +	if (context.len)
> > +		security_release_secctx(&context);
> >  	return NULL;
> >  }
> >  
> > -- 
> > 2.24.1
> > 
> 

-- 
James Morris
<jmorris@namei.org>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

