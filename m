Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D92AC214058
	for <lists+linux-audit@lfdr.de>; Fri,  3 Jul 2020 22:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593808003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/7fLDAaMvBmNs9ZBQTa4ndQWaA1KScG+BS5XzNqY+PI=;
	b=imgmoNXLEh/RTneRQJoQxT2FaahUPzhpmxs1aODhvWAY4tRN73JmK+RT6pFO7WnWcAGSYt
	XkT68vee1E0EBkyAqzqIxVeebatoGAJ96i9cSpzD83j7rBXEKPmFncj7a19erUBNKl52f5
	Uinoa45S+m7mCVgJxHUUSMlNO59okOk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-fyUodhahNL6Iq4VYgc-1hQ-1; Fri, 03 Jul 2020 16:26:41 -0400
X-MC-Unique: fyUodhahNL6Iq4VYgc-1hQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 320091005510;
	Fri,  3 Jul 2020 20:26:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA65F51C4C;
	Fri,  3 Jul 2020 20:26:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F15CD965B0;
	Fri,  3 Jul 2020 20:26:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 063KQ8Jj020727 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 3 Jul 2020 16:26:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03F55100238C; Fri,  3 Jul 2020 20:26:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.3])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A14F1002382;
	Fri,  3 Jul 2020 20:25:59 +0000 (UTC)
Date: Fri, 3 Jul 2020 16:25:57 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH] audit: use the proper gfp flags in the audit_log_nfcfg()
	calls
Message-ID: <20200703202557.tm6o33uignjpmepa@madcap2.tricolour.ca>
References: <159378341669.5956.13490174029711421419.stgit@sifl>
MIME-Version: 1.0
In-Reply-To: <159378341669.5956.13490174029711421419.stgit@sifl>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	Jones Desougi <jones.desougi+netfilter@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-07-03 09:36, Paul Moore wrote:
> Commit 142240398e50 ("audit: add gfp parameter to audit_log_nfcfg")
> incorrectly passed gfp flags to audit_log_nfcfg() which were not
> consistent with the calling function, this commit fixes that.
> 
> Fixes: 142240398e50 ("audit: add gfp parameter to audit_log_nfcfg")
> Reported-by: Jones Desougi <jones.desougi+netfilter@gmail.com>
> Signed-off-by: Paul Moore <paul@paul-moore.com>

Looks good to me.  For what it's worth:

Reviewed-by: Richard Guy Briggs <rgb@redhat.com>

> ---
>  net/netfilter/nf_tables_api.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/net/netfilter/nf_tables_api.c b/net/netfilter/nf_tables_api.c
> index f7ff91479647..886e64291f41 100644
> --- a/net/netfilter/nf_tables_api.c
> +++ b/net/netfilter/nf_tables_api.c
> @@ -5953,7 +5953,7 @@ static int nf_tables_dump_obj(struct sk_buff *skb, struct netlink_callback *cb)
>  				goto cont;
>  
>  			if (reset) {
> -				char *buf = kasprintf(GFP_KERNEL,
> +				char *buf = kasprintf(GFP_ATOMIC,
>  						      "%s:%llu;?:0",
>  						      table->name,
>  						      table->handle);
> @@ -5962,7 +5962,7 @@ static int nf_tables_dump_obj(struct sk_buff *skb, struct netlink_callback *cb)
>  						family,
>  						obj->handle,
>  						AUDIT_NFT_OP_OBJ_RESET,
> -						GFP_KERNEL);
> +						GFP_ATOMIC);
>  				kfree(buf);
>  			}
>  
> @@ -6084,7 +6084,7 @@ static int nf_tables_getobj(struct net *net, struct sock *nlsk,
>  				family,
>  				obj->handle,
>  				AUDIT_NFT_OP_OBJ_RESET,
> -				GFP_KERNEL);
> +				GFP_ATOMIC);
>  		kfree(buf);
>  	}
>  
> @@ -6172,7 +6172,7 @@ void nft_obj_notify(struct net *net, const struct nft_table *table,
>  			event == NFT_MSG_NEWOBJ ?
>  				AUDIT_NFT_OP_OBJ_REGISTER :
>  				AUDIT_NFT_OP_OBJ_UNREGISTER,
> -			GFP_KERNEL);
> +			gfp);
>  	kfree(buf);
>  
>  	if (!report &&
> 

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

