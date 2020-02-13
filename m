Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2F515C057
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 15:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581604228;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C8XBSLv6xuNai79ljSmBWzyYdy+cQFcRP8G9kVTpWYg=;
	b=NRla/1nDvmEOGMx4rMtYK797rYgG70qWrlIkNTJqyUh+iZL5xMM7hbSUEhJa3fM6HRCG+U
	yPw355oYpZKzo/D9JdJZyjCI3uacQV+L3h4T/QMd1fSeGprhT9Bye8wcAOsduERz3CguDQ
	tlzin6+NBfPh5PIirT474OqErBUxkxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-uLjViqpNMRGBsBLyX-nWKQ-1; Thu, 13 Feb 2020 09:30:23 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F3348DD866;
	Thu, 13 Feb 2020 14:30:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679EB60BF1;
	Thu, 13 Feb 2020 14:30:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AD788B2AE;
	Thu, 13 Feb 2020 14:30:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DETrII010585 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 09:29:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 643F95D9E5; Thu, 13 Feb 2020 14:29:53 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (ovpn-112-16.rdu2.redhat.com
	[10.10.112.16])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 294495DA85;
	Thu, 13 Feb 2020 14:29:45 +0000 (UTC)
Date: Thu, 13 Feb 2020 09:29:43 -0500
From: Richard Guy Briggs <rgb@redhat.com>
To: Florian Westphal <fw@strlen.de>
Subject: Re: [PATCH ghak25 v2 8/9] netfilter: add audit operation field
Message-ID: <20200213142943.zxa6vwvl45q36zu6@madcap2.tricolour.ca>
References: <cover.1577830902.git.rgb@redhat.com>
	<6768f7c7d9804216853e6e9c59e44f8a10f46b99.1577830902.git.rgb@redhat.com>
	<20200106202306.GO795@breakpoint.cc>
	<20200213121410.b2dsh2kwg3k7xg7e@madcap2.tricolour.ca>
	<20200213123457.GO2991@breakpoint.cc>
MIME-Version: 1.0
In-Reply-To: <20200213123457.GO2991@breakpoint.cc>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-MC-Unique: uLjViqpNMRGBsBLyX-nWKQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-02-13 13:34, Florian Westphal wrote:
> Richard Guy Briggs <rgb@redhat.com> wrote:
> > The default policy is NF_ACCEPT (because Rusty didn't want
> > more email, go figure...).  It occurred to me later that some table
> > loads took a command line parameter to be able to change the default
> > policy verdict from NF_ACCEPT to NF_DROP.  In particular, filter FORWARD
> > hook tables.  Is there a straightforward way to be able to detect this
> > in all the audit_nf_cfg() callers to be able to log it?  In particular,
> > in:
> > 	net/bridge/netfilter/ebtables.c: ebt_register_table()
> > 	net/bridge/netfilter/ebtables.c: do_replace_finish()
> > 	net/bridge/netfilter/ebtables.c: __ebt_unregister_table()
> > 	net/netfilter/x_tables.c: xt_replace_table()
> > 	net/netfilter/x_tables.c: xt_unregister_table()
> 
> The module parameter or the policy?
> 
> The poliy can be changed via the xtables tools.
> Given you can have:
> 
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD DROP [0:0]
> :OUTPUT ACCEPT [0:0]
> -A FORWARD -j ACCEPT
> COMMIT
> 
> ... which effectily gives a FORWARD ACCEPT policy I'm not sure logging
> the policy is useful.
> 
> Furthermore, ebtables has polices even for user-defined chains.
> 
> > Both potential solutions are awkward, adding a parameter to pass that
> > value in, but also trying to reach into the protocol-specific entry
> > table to find that value.  Would you have a recommendation?  This
> > assumes that reporting that default policy value is even desired or
> > required.
> 
> See above, I don't think its useful.  If it is needed, its probably best
> to define an informational struct containing the policy (accept/drop)
> value for the each hook points (prerouting to postrouting),  fill
> that from the backend specific code (as thats the only place that
> exposes the backend specific structs ...) and then pass that to
> the audit logging functions.

Ok, for this set, I'll drop the idea.  If it becomes apparent later than
it is necessary, it can be added as a field at the end of the record.

Thanks for looking at this.

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

