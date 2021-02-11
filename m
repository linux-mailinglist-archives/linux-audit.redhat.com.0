Return-Path: <linux-audit-bounces@listman.redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id D7D5931CFF6
	for <lists+linux-audit@lfdr.de>; Tue, 16 Feb 2021 19:13:36 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-FEHwV4_aNxWD4z0lv9RL5Q-1; Tue, 16 Feb 2021 13:13:32 -0500
X-MC-Unique: FEHwV4_aNxWD4z0lv9RL5Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F111020C22;
	Tue, 16 Feb 2021 18:13:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14CAC5D9D3;
	Tue, 16 Feb 2021 18:13:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B621B58073;
	Tue, 16 Feb 2021 18:13:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BMbVJU003341 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 17:37:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A7F22166B2E; Thu, 11 Feb 2021 22:37:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 538152166B32
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 22:37:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54592857AB2
	for <linux-audit@redhat.com>; Thu, 11 Feb 2021 22:37:28 +0000 (UTC)
Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc
	[193.142.43.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-522-KuwK1Rm3NheihwkD6jI9bg-1; Thu, 11 Feb 2021 17:37:24 -0500
X-MC-Unique: KuwK1Rm3NheihwkD6jI9bg-1
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1lAK9S-0005k6-N8; Thu, 11 Feb 2021 23:09:30 +0100
Date: Thu, 11 Feb 2021 23:09:30 +0100
From: Florian Westphal <fw@strlen.de>
To: Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH ghak124 v3] audit: log nftables configuration change events
Message-ID: <20210211220930.GC2766@breakpoint.cc>
References: <f9da8b5dbf2396b621c77c17b5b1123be5aa484e.1591275439.git.rgb@redhat.com>
	<20210211151606.GX3158@orbyte.nwl.cc>
	<CAHC9VhTNQW9d=8GCW-70vAEMh8-LXviP+JHFC2-YkuitokLLMQ@mail.gmail.com>
	<20210211202628.GP2015948@madcap2.tricolour.ca>
MIME-Version: 1.0
In-Reply-To: <20210211202628.GP2015948@madcap2.tricolour.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:11:57 -0500
Cc: Phil Sutter <phil@nwl.cc>, fw@strlen.de,
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

Richard Guy Briggs <rgb@redhat.com> wrote:
> > > I personally would notify once per transaction. This is easy and quic=
k.
>=20
> This was the goal.  iptables was atomic.  nftables appears to no longer
> be so.  If I have this wrong, please show how that works.

nftables transactions are atomic, either the entire batch takes effect or n=
ot
at all.

The audit_log_nfcfg() calls got added to the the nft monitor infra which
is designed to allow userspace to follow the entire content of the
transaction log.

So, if its just a 'something was changed' event that is needed all of
them can be removed. ATM the audit_log_nfcfg() looks like this:

        /* step 3. Start new generation, rules_gen_X now in use. */
        net->nft.gencursor =3D nft_gencursor_next(net);

        list_for_each_entry_safe(trans, next, &net->nft.commit_list, list) =
{
                switch (trans->msg_type) {
                case NFT_MSG_NEWTABLE:
=09=09=09audit_log_nfcfg();
=09=09=09...
=09=09case NFT_MSG_...
=09=09=09audit_log_nfcfg();
=09..
=09       =09}

which gives an audit_log for every single change in the batch.

So, if just a summary is needed a single audit_log_nfcfg()
after 'step 3' and outside of the list_for_each_entry_safe() is all
that is needed.

If a summary is wanted as well one could fe. count the number of
transaction types in the batch, e.g. table adds, chain adds, rule
adds etc. and then log a summary count instead.

--
Linux-audit mailing list
Linux-audit@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

