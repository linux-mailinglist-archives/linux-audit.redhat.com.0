Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0499E2AF02F
	for <lists+linux-audit@lfdr.de>; Wed, 11 Nov 2020 12:59:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-ZE1QGYQuOvilNWmlsdtqsw-1; Wed, 11 Nov 2020 06:59:17 -0500
X-MC-Unique: ZE1QGYQuOvilNWmlsdtqsw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4085835B49;
	Wed, 11 Nov 2020 11:59:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C7A27BB5;
	Wed, 11 Nov 2020 11:59:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61532181A050;
	Wed, 11 Nov 2020 11:59:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AADgomw019523 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 10 Nov 2020 08:42:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E99812EFA3; Tue, 10 Nov 2020 13:42:49 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E354D2EFB0
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 13:42:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B01F6858290
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 13:42:46 +0000 (UTC)
Received: from mail.us.es (correo.us.es [193.147.175.20]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-212-53Fzo6KfMva792cH4uDuUg-1;
	Tue, 10 Nov 2020 08:42:44 -0500
X-MC-Unique: 53Fzo6KfMva792cH4uDuUg-1
Received: from antivirus1-rhel7.int (unknown [192.168.2.11])
	by mail.us.es (Postfix) with ESMTP id 735BF396276
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 14:37:18 +0100 (CET)
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id 61CF0DA722
	for <linux-audit@redhat.com>; Tue, 10 Nov 2020 14:37:18 +0100 (CET)
Received: by antivirus1-rhel7.int (Postfix, from userid 99)
	id 4A746DA852; Tue, 10 Nov 2020 14:37:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on antivirus1-rhel7.int
X-Spam-Level: 
X-Spam-Status: No, score=-108.2 required=7.5 tests=ALL_TRUSTED,BAYES_50,
	SMTPAUTH_US2,URIBL_BLOCKED,USER_IN_WELCOMELIST,USER_IN_WHITELIST
	autolearn=disabled version=3.4.1
Received: from antivirus1-rhel7.int (localhost [127.0.0.1])
	by antivirus1-rhel7.int (Postfix) with ESMTP id ADF1ADA789;
	Tue, 10 Nov 2020 14:37:15 +0100 (CET)
Received: from 192.168.1.97 (192.168.1.97)
	by antivirus1-rhel7.int (F-Secure/fsigk_smtp/550/antivirus1-rhel7.int); 
	Tue, 10 Nov 2020 14:37:15 +0100 (CET)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/antivirus1-rhel7.int)
Received: from us.es (unknown [90.77.255.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: 1984lsi)
	by entrada.int (Postfix) with ESMTPSA id 7CCF642EF9E0;
	Tue, 10 Nov 2020 14:37:15 +0100 (CET)
Date: Tue, 10 Nov 2020 14:37:15 +0100
X-SMTPAUTHUS: auth mail.us.es
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: [PATCH v22 16/23] LSM: security_secid_to_secctx in netlink
	netfilter
Message-ID: <20201110133715.GA1890@salvia>
References: <20201105004924.11651-1-casey@schaufler-ca.com>
	<20201105004924.11651-17-casey@schaufler-ca.com>
MIME-Version: 1.0
In-Reply-To: <20201105004924.11651-17-casey@schaufler-ca.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 11 Nov 2020 06:57:51 -0500
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	netdev@vger.kernel.org, jmorris@namei.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	netfilter-devel@vger.kernel.org, casey.schaufler@intel.com,
	sds@tycho.nsa.gov
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Casey,

On Wed, Nov 04, 2020 at 04:49:17PM -0800, Casey Schaufler wrote:
> Change netlink netfilter interfaces to use lsmcontext
> pointers, and remove scaffolding.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Johansen <john.johansen@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> Cc: netdev@vger.kernel.org
> Cc: netfilter-devel@vger.kernel.org

You can carry this tag in your follow up patches.

Acked-by: Pablo Neira Ayuso <pablo@netfilter.org>

Thanks.

> ---
>  net/netfilter/nfnetlink_queue.c | 37 +++++++++++++--------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
> 
> diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
> index 84be5a49a157..0d8b83d84422 100644
> --- a/net/netfilter/nfnetlink_queue.c
> +++ b/net/netfilter/nfnetlink_queue.c
> @@ -301,15 +301,13 @@ static int nfqnl_put_sk_uidgid(struct sk_buff *skb, struct sock *sk)
>  	return -1;
>  }
>  
> -static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
> +static void nfqnl_get_sk_secctx(struct sk_buff *skb, struct lsmcontext *context)
>  {
> -	u32 seclen = 0;
>  #if IS_ENABLED(CONFIG_NETWORK_SECMARK)
>  	struct lsmblob blob;
> -	struct lsmcontext context = { };
>  
>  	if (!skb || !sk_fullsock(skb->sk))
> -		return 0;
> +		return;
>  
>  	read_lock_bh(&skb->sk->sk_callback_lock);
>  
> @@ -318,14 +316,12 @@ static u32 nfqnl_get_sk_secctx(struct sk_buff *skb, char **secdata)
>  		 * blob. security_secid_to_secctx() will know which security
>  		 * module to use to create the secctx.  */
>  		lsmblob_init(&blob, skb->secmark);
> -		security_secid_to_secctx(&blob, &context);
> -		*secdata = context.context;
> +		security_secid_to_secctx(&blob, context);
>  	}
>  
>  	read_unlock_bh(&skb->sk->sk_callback_lock);
> -	seclen = context.len;
>  #endif
> -	return seclen;
> +	return;
>  }
>  
>  static u32 nfqnl_get_bridge_size(struct nf_queue_entry *entry)
> @@ -398,12 +394,10 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	struct net_device *indev;
>  	struct net_device *outdev;
>  	struct nf_conn *ct = NULL;
> +	struct lsmcontext context = { };
>  	enum ip_conntrack_info ctinfo;
>  	struct nfnl_ct_hook *nfnl_ct;
>  	bool csum_verify;
> -	struct lsmcontext scaff; /* scaffolding */
> -	char *secdata = NULL;
> -	u32 seclen = 0;
>  
>  	size = nlmsg_total_size(sizeof(struct nfgenmsg))
>  		+ nla_total_size(sizeof(struct nfqnl_msg_packet_hdr))
> @@ -469,9 +463,9 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	}
>  
>  	if ((queue->flags & NFQA_CFG_F_SECCTX) && entskb->sk) {
> -		seclen = nfqnl_get_sk_secctx(entskb, &secdata);
> -		if (seclen)
> -			size += nla_total_size(seclen);
> +		nfqnl_get_sk_secctx(entskb, &context);
> +		if (context.len)
> +			size += nla_total_size(context.len);
>  	}
>  
>  	skb = alloc_skb(size, GFP_ATOMIC);
> @@ -604,7 +598,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	    nfqnl_put_sk_uidgid(skb, entskb->sk) < 0)
>  		goto nla_put_failure;
>  
> -	if (seclen && nla_put(skb, NFQA_SECCTX, seclen, secdata))
> +	if (context.len &&
> +	    nla_put(skb, NFQA_SECCTX, context.len, context.context))
>  		goto nla_put_failure;
>  
>  	if (ct && nfnl_ct->build(skb, ct, ctinfo, NFQA_CT, NFQA_CT_INFO) < 0)
> @@ -632,10 +627,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	}
>  
>  	nlh->nlmsg_len = skb->len;
> -	if (seclen) {
> -		lsmcontext_init(&scaff, secdata, seclen, 0);
> -		security_release_secctx(&scaff);
> -	}
> +	if (context.len)
> +		security_release_secctx(&context);
>  	return skb;
>  
>  nla_put_failure:
> @@ -643,10 +636,8 @@ nfqnl_build_packet_message(struct net *net, struct nfqnl_instance *queue,
>  	kfree_skb(skb);
>  	net_err_ratelimited("nf_queue: error creating packet message\n");
>  nlmsg_failure:
> -	if (seclen) {
> -		lsmcontext_init(&scaff, secdata, seclen, 0);
> -		security_release_secctx(&scaff);
> -	}
> +	if (context.len)
> +		security_release_secctx(&context);
>  	return NULL;
>  }
>  
> -- 
> 2.24.1
> 

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

