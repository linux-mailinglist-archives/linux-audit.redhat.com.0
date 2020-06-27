Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6198520C355
	for <lists+linux-audit@lfdr.de>; Sat, 27 Jun 2020 19:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593279375;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EKNhEeBq+dkrQqBtvK0qQVYG7cmI+h+y9SklzrGQ/yk=;
	b=VfYlT4kTjCeQVuQ0/zo1CAEv3gPG2kxs29pOWfRCJn28W4wfTEt0CxaIcA+8FcIIczbW6x
	6v/gnZ/dPMZU+/UrwpSxNxErNhKauKBZeHBGGY3tNrJCjUEEP7gU+V8CoRafuaXOR/IrWq
	jjGF9uMFt+SZBDUCxlwIe/untkBOCSQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-LGP3wS2rNdO9-aIC43FhZg-1; Sat, 27 Jun 2020 13:36:13 -0400
X-MC-Unique: LGP3wS2rNdO9-aIC43FhZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DB211005512;
	Sat, 27 Jun 2020 17:36:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0DA660BF1;
	Sat, 27 Jun 2020 17:36:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6851A833A2;
	Sat, 27 Jun 2020 17:35:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05RHZiOX002369 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 13:35:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1529160BF4; Sat, 27 Jun 2020 17:35:44 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 527BE60BF1;
	Sat, 27 Jun 2020 17:35:36 +0000 (UTC)
Date: Sat, 27 Jun 2020 13:35:33 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] audit: log nftables configuration change events
Message-ID: <20200627173533.aqh4p2nbr33ea3eu@madcap2.tricolour.ca>
References: <20200626102242.GA313925@mwanda>
MIME-Version: 1.0
In-Reply-To: <20200626102242.GA313925@mwanda>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, netfilter-devel@vger.kernel.org
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-06-26 13:22, Dan Carpenter wrote:
> Hello Richard Guy Briggs,
> 
> The patch 8e6cf365e1d5: "audit: log nftables configuration change
> events" from Jun 4, 2020, leads to the following static checker
> warning:
> 
> 	net/netfilter/nf_tables_api.c:6160 nft_obj_notify()
> 	warn: use 'gfp' here instead of GFP_XXX?
> 
> net/netfilter/nf_tables_api.c
>   6153  void nft_obj_notify(struct net *net, const struct nft_table *table,
>   6154                      struct nft_object *obj, u32 portid, u32 seq, int event,
>   6155                      int family, int report, gfp_t gfp)
>                                                     ^^^^^^^^^
>   6156  {
>   6157          struct sk_buff *skb;
>   6158          int err;
>   6159          char *buf = kasprintf(GFP_KERNEL, "%s:%llu;?:0",
>                                       ^^^^^^^^^^
> This should probably be "gfp".

Agreed, nice catch.  Checking other similar uses from that patch
leads me to another bug and the need to extend audit_log_nfcfg() to
accept a GFP flag.  Patch coming...

>   6160                                table->name, table->handle);
>   6161  
>   6162          audit_log_nfcfg(buf,
>   6163                          family,
>   6164                          obj->handle,
>   6165                          event == NFT_MSG_NEWOBJ ?
>   6166                                  AUDIT_NFT_OP_OBJ_REGISTER :
>   6167                                  AUDIT_NFT_OP_OBJ_UNREGISTER);
>   6168          kfree(buf);
>   6169  
>   6170          if (!report &&
>   6171              !nfnetlink_has_listeners(net, NFNLGRP_NFTABLES))
>   6172                  return;
>   6173  
>   6174          skb = nlmsg_new(NLMSG_GOODSIZE, gfp);
>                                                 ^^^
> 
>   6175          if (skb == NULL)
>   6176                  goto err;
>   6177  
>   6178          err = nf_tables_fill_obj_info(skb, net, portid, seq, event, 0, family,
>   6179                                        table, obj, false);
>   6180          if (err < 0) {
>   6181                  kfree_skb(skb);
>   6182                  goto err;
>   6183          }
>   6184  
>   6185          nfnetlink_send(skb, net, portid, NFNLGRP_NFTABLES, report, gfp);
>   6186          return;
>   6187  err:
>   6188          nfnetlink_set_err(net, portid, NFNLGRP_NFTABLES, -ENOBUFS);
>   6189  }
> 
> regards,
> dan carpenter

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

