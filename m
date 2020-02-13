Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DD87D15BF2B
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 14:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581600216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JGbpYk2cU359WhnPm6EoJ6/MVLQ8TKkzMDhmO4DnzeA=;
	b=HcrkgSBM0V2sJeEWDgJJfWo2Meo2qRXVLlvdeqgBmGECKycLUPCLHNodwEhkKP5bFSCsBd
	eSYYQi38pgNjFaEt6VH7t6HYp0Xl7mza2pc8sMcPww4plD5Urpl2wc7kosIj0cLn8lR4Xm
	ZtakuIHDI710+oq69ibShvFAsj4Iils=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-o3UFX1R1Oma4gqVc7SqeUQ-1; Thu, 13 Feb 2020 08:23:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BBDA8E2DC1;
	Thu, 13 Feb 2020 13:23:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DBC60BF4;
	Thu, 13 Feb 2020 13:23:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46AB3182B00F;
	Thu, 13 Feb 2020 13:23:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DCZ8TX002516 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 07:35:08 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AB251054FDB; Thu, 13 Feb 2020 12:35:08 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6071054FD9
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 12:35:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA7408E3897
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 12:35:04 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-414-yi1SzqQ-NeGG8C4wjVUynA-1; Thu, 13 Feb 2020 07:35:02 -0500
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1j2Dhp-0004oY-Ks; Thu, 13 Feb 2020 13:34:57 +0100
Date: Thu, 13 Feb 2020 13:34:57 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak25 v2 8/9] netfilter: add audit operation field
Message-ID: <20200213123457.GO2991@breakpoint.cc>
References: <cover.1577830902.git.rgb@redhat.com>
	<6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
	<20200106202306.GO795@breakpoint.cc>
	<20200213121410.b2dsh2kwg3k7xg7e@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20200213121410.b2dsh2kwg3k7xg7e@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: yi1SzqQ-NeGG8C4wjVUynA-1
X-MC-Unique: o3UFX1R1Oma4gqVc7SqeUQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DCZ8TX002516
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Thu, 13 Feb 2020 08:23:04 -0500
Cc: Florian Westphal <fw@strlen.de>, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
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

Richard Guy Briggs <rgb@redhat.com> wrote:
> The default policy is NF_ACCEPT (because Rusty didn't want
> more email, go figure...).  It occurred to me later that some table
> loads took a command line parameter to be able to change the default
> policy verdict from NF_ACCEPT to NF_DROP.  In particular, filter FORWARD
> hook tables.  Is there a straightforward way to be able to detect this
> in all the audit_nf_cfg() callers to be able to log it?  In particular,
> in:
> 	net/bridge/netfilter/ebtables.c: ebt_register_table()
> 	net/bridge/netfilter/ebtables.c: do_replace_finish()
> 	net/bridge/netfilter/ebtables.c: __ebt_unregister_table()
> 	net/netfilter/x_tables.c: xt_replace_table()
> 	net/netfilter/x_tables.c: xt_unregister_table()

The module parameter or the policy?

The poliy can be changed via the xtables tools.
Given you can have:

*filter
:INPUT ACCEPT [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A FORWARD -j ACCEPT
COMMIT

... which effectily gives a FORWARD ACCEPT policy I'm not sure logging
the policy is useful.

Furthermore, ebtables has polices even for user-defined chains.

> Both potential solutions are awkward, adding a parameter to pass that
> value in, but also trying to reach into the protocol-specific entry
> table to find that value.  Would you have a recommendation?  This
> assumes that reporting that default policy value is even desired or
> required.

See above, I don't think its useful.  If it is needed, its probably best
to define an informational struct containing the policy (accept/drop)
value for the each hook points (prerouting to postrouting),  fill
that from the backend specific code (as thats the only place that
exposes the backend specific structs ...) and then pass that to
the audit logging functions.


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

