Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2F231CFEE
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:13:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-9utzhf3lNvC-ViJRX1HJGw-1; Tue, 16 Feb 2021 13:13:01 -0500
X-MC-Unique: 9utzhf3lNvC-ViJRX1HJGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43EAB1005501;
	Tue, 16 Feb 2021 18:12:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 249A85D9E3;
	Tue, 16 Feb 2021 18:12:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6380B58074;
	Tue, 16 Feb 2021 18:12:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11CCBP38031550 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 12 Feb 2021 07:11:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 39E64115D375; Fri, 12 Feb 2021 12:11:25 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35CAC115D372
	for <linux-audit@redhat.com>; Fri, 12 Feb 2021 12:11:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA96F811760
	for <linux-audit@redhat.com>; Fri, 12 Feb 2021 12:11:22 +0000 (UTC)
Received: from orbyte.nwl.cc (orbyte.nwl.cc [151.80.46.58]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-20-jljGc3ecOrWPd5VxTx9C6w-1;
	Fri, 12 Feb 2021 07:11:16 -0500
X-MC-Unique: jljGc3ecOrWPd5VxTx9C6w-1
Received: from n0-1 by orbyte.nwl.cc with local (Exim 4.94)
	(envelope-from <n0-1@orbyte.nwl.cc>)
	id 1lAXI0-00055e-7W; Fri, 12 Feb 2021 13:11:12 +0100
Date: Fri, 12 Feb 2021 13:11:12 +0100
From: Phil Sutter <phil@nwl.cc>
To: Steve Grubb <sgrubb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210212121112.GA3158@orbyte.nwl.cc>
Mail-Followup-To: Phil Sutter <phil@nwl.cc>, Steve Grubb <sgrubb@redhat.com>,
	Richard Guy Briggs <rgb@redhat.com>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	Ondrej Mosnacek <omosnace@redhat.com>, fw@strlen.de,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<4087569.ejJDZkT8p0@x2>
MIME-Version: 1.0
In-Reply-To: <4087569.ejJDZkT8p0@x2>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
Cc: Richard Guy Briggs <rgb@redhat.com>, fw@strlen.de,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 11, 2021 at 04:02:55PM -0500, Steve Grubb wrote:
> On Thursday, February 11, 2021 11:29:34 AM EST Paul Moore wrote:
> > > If I'm not mistaken, iptables emits a single audit log per table, ips=
et
> > > doesn't support audit at all. So I wonder how much audit logging is
> > > required at all (for certification or whatever reason). How much
> > > granularity is desired?
> =20
>   <snip>=20
>=20
> > I believe the netfilter auditing was mostly a nice-to-have bit of
> > functionality to help add to the completeness of the audit logs, but I
> > could very easily be mistaken.  Richard put together those patches, he
> > can probably provide the background/motivation for the effort.
>=20
> There are certifications which levy requirements on information flow cont=
rol.=20
> The firewall can decide if information should flow or be blocked. Informa=
tion=20
> flow decisions need to be auditable - which we have with the audit target=
.=20

In nftables, this is realized via 'log level audit' statement.
Functionality should by all means be identical to that of xtables' AUDIT
target.

> That then swings in requirements on the configuration of the information =
flow=20
> policy.
>=20
> The requirements state a need to audit any management activity - meaning =
the=20
> creation, modification, and/or deletion of a "firewall ruleset". Because =
it=20
> talks constantly about a ruleset and then individual rules, I suspect onl=
y 1=20
> summary event is needed to say something happened, who did it, and the=20
> outcome. This would be in line with how selinux is treated: we have 1 sum=
mary=20
> event for loading/modifying/unloading selinux policy.

So the central element are firewall rules for audit purposes and
NETFILTER_CFG notifications merely serve asserting changes to those
rules are noticed by the auditing system. Looking at xtables again, this
seems coherent: Any change causes the whole table blob to be replaced
(while others stay in place). So table replace/create is the most common
place for a change notification. In nftables, the most common one is
generation dump - all tables are treated as elements of the same
ruleset, not individually like in xtables.

Richard, assuming the above is correct, are you fine with reducing
nftables auditing to a single notification per transaction then? I guess
Florian sufficiently illustrated how this would be implemented.

> Hope this helps...

It does, thanks a lot for the information!

Thanks, Phil

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

