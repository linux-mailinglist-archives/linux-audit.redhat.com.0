Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id D499431CFF5
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:13:16 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-JqmliQ1sOCmIOyeAuHc9Tw-1; Tue, 16 Feb 2021 13:13:11 -0500
X-MC-Unique: JqmliQ1sOCmIOyeAuHc9Tw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FA98030C2;
	Tue, 16 Feb 2021 18:13:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C1F60C15;
	Tue, 16 Feb 2021 18:13:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A9C418095CB;
	Tue, 16 Feb 2021 18:13:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BFW0uG018379 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 10:32:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DDE1DF882D; Thu, 11 Feb 2021 15:32:00 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8444F882F
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 15:31:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8635F800BFF
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 15:31:58 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [151.80.46.58]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-161-2q9vijFbNoCBBU7mJmvUzg-1;
	Thu, 11 Feb 2021 10:31:54 -0500
X-MC-Unique: 2q9vijFbNoCBBU7mJmvUzg-1
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.94)
	(envelope-from <n0-1@orbyte.nwl.cc>)
	id 1lADhO-0002Ym-8N; Thu, 11 Feb 2021 16:16:06 +0100
Date: Thu, 11 Feb 2021 16:16:06 +0100
From: Phil Sutter <phil@nwl.cc>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210211151606.GX3158@orbyte.nwl.cc>
Mail-Followup-To: Phil Sutter <phil@nwl.cc>,
	Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	sgrubb@redhat.com, omosnace@redhat.com, fw@strlen.de,
	twoerner@redhat.com, eparis@parisplace.org, tgraf@infradead.org
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
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
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	eparis@parisplace.org, tgraf@infradead.org
X-BeenThere: linux-audit@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@listman.redhat.com>
List-Help: <mailto:linux-audit-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@listman.redhat.com?subject=subscribe>
Sender: linux-audit-bounces@listman.redhat.com
Errors-To: linux-audit-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 04, 2020 at 09:20:49AM -0400, Richard Guy Briggs wrote:
> iptables, ip6tables, arptables and ebtables table registration,
> replacement and unregistration configuration events are logged for the
> native (legacy) iptables setsockopt api, but not for the
> nftables netlink api which is used by the nft-variant of iptables in
> addition to nftables itself.
>=20
> Add calls to log the configuration actions in the nftables netlink api.

As discussed offline already, these audit notifications are pretty hefty
performance-wise. In an internal report, 300% restore time of a ruleset
containing 70k set elements is measured.

If I'm not mistaken, iptables emits a single audit log per table, ipset
doesn't support audit at all. So I wonder how much audit logging is
required at all (for certification or whatever reason). How much
granularity is desired?

I personally would notify once per transaction. This is easy and quick.
Once per table or chain should be acceptable, as well. At the very
least, we should not have to notify once per each element. This is the
last resort of fast ruleset adjustments. If we lose it, people are
better off with ipset IMHO.

Unlike nft monitor, auditd is not designed to be disabled "at will". So
turning it off for performance-critical workloads is no option.

Cheers, Phil

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

