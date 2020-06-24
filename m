Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 62B60206918
	for <lists+linux-audit@lfdr.de>; Wed, 24 Jun 2020 02:35:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592958928;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=a+uG+ZBcA8swPoxi0X4eeCcUkbELQompGBZoKwTMx/Y=;
	b=hVh3CJe+4LD9WE0VOtN+5YwtHJhG3jdUuugrgFtTHLGA0MYQChCFKwPsin28YSbPaPL/y6
	cBqZfsWQn1M557a45g8NqwGdB1nf5ZxN92+Mtnu2x1USCHQ/ZgerdRKgrLBDATuNCBD8i9
	dmxEk2Axqxsegry6QXR+aw98wYbQi1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-W4FiPVFAM8KVCPlVkUJs_w-1; Tue, 23 Jun 2020 20:35:25 -0400
X-MC-Unique: W4FiPVFAM8KVCPlVkUJs_w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B07A800597;
	Wed, 24 Jun 2020 00:35:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 965F860F89;
	Wed, 24 Jun 2020 00:35:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7DE0833CF;
	Wed, 24 Jun 2020 00:35:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O0ZCfL018457 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 20:35:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D21C2156A22; Wed, 24 Jun 2020 00:35:12 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58F112157F24
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 00:35:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FB5D800883
	for <linux-audit@redhat.com>; Wed, 24 Jun 2020 00:35:10 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-289-_NStrcR5N1aFealFkPaB1A-1; Tue, 23 Jun 2020 20:35:08 -0400
X-MC-Unique: _NStrcR5N1aFealFkPaB1A-1
Received: by mail-ed1-f65.google.com with SMTP id dg28so178274edb.3
	for <linux-audit@redhat.com>; Tue, 23 Jun 2020 17:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+/TMyKbqoSzMGZ/AAiVOjNfJfvqMvVU1A+eHQRRA5RQ=;
	b=WZfxCP2Fw+p+lGNfME3lqPRYfoRQ/bV2Gvf+HsKkukHLo0ctI3HY+Vc2Q66UzSvLaa
	FO+YlViv9xvPi6IPltbfPOsGVJrOAxZAi2+c2RR3jR8AumVPB52aVgwhWisty9ayhM/h
	ictPjwjmKAOgZWpD/D6sg8UOXpxXMt6PVLt50Jtfo5yKIkmQC19pTO1kuEj8hnv/ccuZ
	oSPQJMXOPJe/xOU+3Qk5GJZXOorc6vFoxNvoUryODv+PNrGd+xkC727qYzvoTFUxUYwy
	ESu+McHaUuc0MMpmKXEpoCxSJhz6Gfb2HEXSg/2FuXcZ3mzsDbD+xnszRhPvuvfRgUje
	+WfQ==
X-Gm-Message-State: AOAM532KqPxmxaqqt0WKLMpZzPXYo98WFEfIroUjcCe7++8TzKSfdAXy
	fDucn/LAZJ8k9qtNrJLRMtKIwGtNXprq41lXdZSI
X-Google-Smtp-Source: ABdhPJzCoP7TVvW+uzKj9SzidO2EBCvvtbfilZfpp8veq16/F/lTMvRYgUtkcV+HaRYoxjS+CxUYyH2LxC0Ele3/EA8=
X-Received: by 2002:aa7:da46:: with SMTP id w6mr23979297eds.31.1592958906753; 
	Tue, 23 Jun 2020 17:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
In-Reply-To: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 23 Jun 2020 20:34:55 -0400
Message-ID: <CAHC9VhT_dzkoOuoQF5-D9KFDiAUUjX2UJJbKPWAeXkf7fddKsA@mail.gmail.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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

On Thu, Jun 4, 2020 at 9:21 AM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> iptables, ip6tables, arptables and ebtables table registration,
> replacement and unregistration configuration events are logged for the
> native (legacy) iptables setsockopt api, but not for the
> nftables netlink api which is used by the nft-variant of iptables in
> addition to nftables itself.
>
> Add calls to log the configuration actions in the nftables netlink api.
>
> This uses the same NETFILTER_CFG record format but overloads the table
> field.
>
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.878:162) : table=?:0;?:0 family=unspecified entries=2 op=nft_register_gen pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.878:162) : table=firewalld:1;?:0 family=inet entries=0 op=nft_register_table pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;filter_FORWARD:85 family=inet entries=8 op=nft_register_chain pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;filter_FORWARD:85 family=inet entries=101 op=nft_register_rule pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;__set0:87 family=inet entries=87 op=nft_register_setelem pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>   ...
>   type=NETFILTER_CFG msg=audit(2020-05-28 17:46:41.911:163) : table=firewalld:1;__set0:87 family=inet entries=0 op=nft_register_set pid=396 subj=system_u:system_r:firewalld_t:s0 comm=firewalld
>
> For further information please see issue
> https://github.com/linux-audit/audit-kernel/issues/124
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Changelog:
> v3:
> - inline message type rather than table
>
> v2:
> - differentiate between xtables and nftables
> - add set, setelem, obj, flowtable, gen
> - use nentries field as appropriate per type
> - overload the "tables" field with table handle and chain/set/flowtable
>
>  include/linux/audit.h         |  18 ++++++++
>  kernel/auditsc.c              |  24 ++++++++--
>  net/netfilter/nf_tables_api.c | 103 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 142 insertions(+), 3 deletions(-)

I'm not seeing any additional comments from the netfilter folks so
I've gone ahead and merged this into audit/next.  Thanks Richard.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

