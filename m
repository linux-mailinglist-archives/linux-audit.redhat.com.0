Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B477D1E46B5
	for <lists+linux-audit@lfdr.de>; Wed, 27 May 2020 17:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590591680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RSmLFalDZFXnEf8qDu+Ym2/n5AuTTdFhHUNEhgz6kuM=;
	b=Yb2mNN9NXQNv0UiP4ewC6IRwQluW5mOSPekA6QYta0ivAFrG39cbtqz/5xMjbfIaFTYxZf
	jLrO/smw/qYOeJWrFrFotUwLh9k8BxMPxY0mgoYeliNr5ljglSmIZx/h7sEhIUnin7kyyP
	kJPOoNup6LG5eUU5oqvk8yjBxJ1dkOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-x8BviLYQOnOgD3vtlW6f-A-1; Wed, 27 May 2020 11:01:03 -0400
X-MC-Unique: x8BviLYQOnOgD3vtlW6f-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76A8D803F65;
	Wed, 27 May 2020 15:00:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A41AE10013D7;
	Wed, 27 May 2020 15:00:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92CB36B4D6;
	Wed, 27 May 2020 15:00:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RErVx4022352 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 10:53:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D88D10EE6D3; Wed, 27 May 2020 14:53:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290E510EE6D1
	for <linux-audit@redhat.com>; Wed, 27 May 2020 14:53:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 273F9108C267
	for <linux-audit@redhat.com>; Wed, 27 May 2020 14:53:29 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-ZZBahUxcOc236OjTKv534g-1; Wed, 27 May 2020 10:53:21 -0400
X-MC-Unique: ZZBahUxcOc236OjTKv534g-1
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1jdxQj-00084U-6n; Wed, 27 May 2020 16:53:17 +0200
Date: Wed, 27 May 2020 16:53:17 +0200
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v1] audit: log nftables configuration change events
Message-ID: <20200527145317.GI2915@breakpoint.cc>
References: <d92a718b54269f426acc18f28e561031da66d3ca.1590579994.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d92a718b54269f426acc18f28e561031da66d3ca.1590579994.git.rgb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Wed, 27 May 2020 11:00:39 -0400
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Richard Guy Briggs <rgb@redhat.com> wrote:
> iptables, ip6tables, arptables and ebtables table registration,
> replacement and unregistration configuration events are logged for the
> native (legacy) iptables setsockopt api, but not for the
> nftables netlink api which is used by the nft-variant of iptables in
> addition to nftables itself.
> 
> Add calls to log the configuration actions in the nftables netlink api.
> 
> This uses the same NETFILTER_CFG record format.

I know little about audit records.  Does this allow the user to figure
out that this record is created via nf_tables/netlink rather than xtables?

> For further information please see issue
> https://github.com/linux-audit/audit-kernel/issues/124
> 
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> This is an RFC patch.
> Note: I have questions about the "entries" count.  Is there a more
> appropriate or relevant item to report here?
> Note: It might make sense to differentiate in the op= field that this
> was a legacy call vs an nft call.  At the moment, legacy calls overlap
> with nft table calls, which are similar calls.
> 
>  include/linux/audit.h         |  7 +++++++
>  kernel/auditsc.c              | 12 +++++++++---
>  net/netfilter/nf_tables_api.c | 14 ++++++++++++++
>  3 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/audit.h b/include/linux/audit.h
> index 3fcd9ee49734..b10f54103a82 100644
> --- a/include/linux/audit.h
> +++ b/include/linux/audit.h
> @@ -12,6 +12,7 @@
>  #include <linux/sched.h>
>  #include <linux/ptrace.h>
>  #include <uapi/linux/audit.h>
> +#include <uapi/linux/netfilter/nf_tables.h>
>  
>  #define AUDIT_INO_UNSET ((unsigned long)-1)
>  #define AUDIT_DEV_UNSET ((dev_t)-1)
> @@ -98,6 +99,12 @@ enum audit_nfcfgop {
>  	AUDIT_XT_OP_REGISTER,
>  	AUDIT_XT_OP_REPLACE,
>  	AUDIT_XT_OP_UNREGISTER,
> +	AUDIT_XT_OP_CHAIN_REGISTER	= NFT_MSG_NEWCHAIN,

Hmm, this means AUDIT_XT_OP_CHAIN_REGISTER overlaps with the 4th
audit_nfcfgop value...?

> +	AUDIT_XT_OP_CHAIN_NOOP		= NFT_MSG_GETCHAIN,

GETCHAIN can't appear in the commit path (its not changing anything).
Same for all other NFT_MSG_FOO that use ".call_rcu" action.

Futhermore, I wonder what is to be logged by audit.

The fact that there was 'some change'? If so, its enough to log
the increment of the generation count during the commit phase.

(After that, kernel can't back down anymore, i.e. all errors are
 caught/handled beforehand).

If its 'any config change', then you also need to handle adds
or delete from sets/maps, since that may allow something that wasn't
allowed before, e.g. consider

ip saddr @trused accept

and then, later on,
nft add element ip filter @trusted { 10.0.0.0/8, 192.168.0.1 }

This would not add a table, or chain, or set, but it does implicitly
alter the ruleset.

> +		case NFT_MSG_DELRULE:
> +			audit_log_nfcfg(trans->ctx.table->name,
> +					trans->ctx.family,
> +					atomic_read(&trans->ctx.table->chains_ht.ht.nelems),
> +					trans->msg_type);
> +			break;

Is that record format expected to emit the current number of chains?
I'm not sure if that info is meaningful.

Since table names can be anything in nf_tables (they have no special
properties anymore), the table name is interesting from a informational
pov, but not super interesting.

This will also emit the same message/record multiple times, with only
difference being the msg_type.  I'm not sure thats interesting.

Consider a batch update that commits 100 new rules in chain x,
this would result in 100 audit_log_nfcfg() calls, each with the
same information.

There are test cases in nftables.git, you could run them to see what
kind of audit events are generated and how redundant they might be.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

