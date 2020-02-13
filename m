Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 82A1915BE4D
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 13:14:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581596093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CaQxcK8Mi1xAt8P48i/I9dF8jp85MvITukDdrBnOsaE=;
	b=FLmWBvjRyokTgO8wnzzKSalay7dDTDqe5qRWw+xlvIVVHLFE776HxgYd/AWSQhUwSPdPVX
	BNNKJJd4zCy5Am/8H/gewVDMuVobJCPBQJk7e+eRAMMQDtVJ8rWQIgUs4Vzhd2shtZQp9G
	u0f6R/KtdWHhYRhiFuwfqipn+utyI14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-dQ_Oad39NKul70CNEYbjGA-1; Thu, 13 Feb 2020 07:14:50 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A2313EA;
	Thu, 13 Feb 2020 12:14:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827FF60BF1;
	Thu, 13 Feb 2020 12:14:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 850BB18089CD;
	Thu, 13 Feb 2020 12:14:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DCEL5l001323 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 07:14:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 34DB61001B2D; Thu, 13 Feb 2020 12:14:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4E4E1001B0B;
	Thu, 13 Feb 2020 12:14:13 +0000 (UTC)
Date: Thu, 13 Feb 2020 07:14:10 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak25 v2 8/9] netfilter: add audit operation field
Message-ID: <20200213121410.b2dsh2kwg3k7xg7e@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
	<20200106202306.GO795@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20200106202306.GO795@breakpoint.cc>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: LKML <linux-kernel@vger.kernel.org>,
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
X-MC-Unique: dQ_Oad39NKul70CNEYbjGA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-01-06 21:23, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > diff --git a/include/linux/audit.h b/include/linux/audit.h
> > index 96cabb095eed..5eab4d898c26 100644
> > --- a/include/linux/audit.h
> > +++ b/include/linux/audit.h
> > @@ -379,7 +379,7 @@ extern int __audit_log_bprm_fcaps(struct linux_binprm *bprm,
> >  extern void __audit_fanotify(unsigned int response);
> >  extern void __audit_tk_injoffset(struct timespec64 offset);
> >  extern void __audit_ntp_log(const struct audit_ntp_data *ad);
> > -extern void __audit_nf_cfg(const char *name, u8 af, int nentries);
> > +extern void __audit_nf_cfg(const char *name, u8 af, int nentries, int op);
> 
> Consider adding an enum instead of int op.
> 
> >  	if (audit_enabled)
> > -		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries);
> > +		audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, 1);
> 
> audit_nf_cfg(repl->name, AF_BRIDGE, repl->nentries, AUDIT_XT_OP_REPLACE);
> 
> ... would be a bit more readable than '1'.
> 
> The name is just an example, you can pick something else.

Thanks Florian.

Another question occurs to me about table default policy.

I'd observed previously that if nentries was zero due to an empty table,
then it was due to table registration calls, which resulted from module
loading.  The default policy is NF_ACCEPT (because Rusty didn't want
more email, go figure...).  It occurred to me later that some table
loads took a command line parameter to be able to change the default
policy verdict from NF_ACCEPT to NF_DROP.  In particular, filter FORWARD
hook tables.  Is there a straightforward way to be able to detect this
in all the audit_nf_cfg() callers to be able to log it?  In particular,
in:
	net/bridge/netfilter/ebtables.c: ebt_register_table()
	net/bridge/netfilter/ebtables.c: do_replace_finish()
	net/bridge/netfilter/ebtables.c: __ebt_unregister_table()
	net/netfilter/x_tables.c: xt_replace_table()
	net/netfilter/x_tables.c: xt_unregister_table()

It appears to be stored in the second entry of struct ipt_replace and
struct ip6t_replace, of types struct ipt_standard and struct
ip6t_standard in target.verdict, which doesn't appear to be obvious or
easily accessible from xt_replace_table().  In ebtables, it appears to
be in the policy member of struct ebt_entries.

Both potential solutions are awkward, adding a parameter to pass that
value in, but also trying to reach into the protocol-specific entry
table to find that value.  Would you have a recommendation?  This
assumes that reporting that default policy value is even desired or
required.

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

