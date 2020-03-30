Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id A40651984FF
	for <lists+linux-audit@lfdr.de>; Mon, 30 Mar 2020 21:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585598187;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wHc8dBM2NatBiz1npEDFy0lsUN/qjFcpyeDmQlutucc=;
	b=BCpDJFx+vUrDDKEcEcEbhgcnlkknpe00Ml9JjJ68ehHPX0Ge47h0StG7TAsZnWh8AUqWHJ
	d1F/VNsBs4QmtAcQTxiFYDQJo8cDDaMlkrKJwD3lAdsaUeenLsoCP4kkHfwWr9K9RWxX+Z
	yGMIUUqkwVfwzNLQXxo+eg02vYdVcBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-NjxTl6fNMt-h45Me7LVJ2g-1; Mon, 30 Mar 2020 15:56:25 -0400
X-MC-Unique: NjxTl6fNMt-h45Me7LVJ2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC4C51005509;
	Mon, 30 Mar 2020 19:56:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9401950C01;
	Mon, 30 Mar 2020 19:56:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81C3218089CD;
	Mon, 30 Mar 2020 19:56:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UJtsen011130 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 15:55:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 436D72166B30; Mon, 30 Mar 2020 19:55:54 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F8672166B32
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 19:55:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CF4B185A78E
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 19:55:52 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-TvggTJeAODiob87YXwxIbA-1; Mon, 30 Mar 2020 15:55:47 -0400
X-MC-Unique: TvggTJeAODiob87YXwxIbA-1
Received: by mail-ed1-f65.google.com with SMTP id cw6so21574006edb.9
	for <linux-audit@redhat.com>; Mon, 30 Mar 2020 12:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dh9JcSi6kj0UWIbirpsquHk1PO2ZTJ6f6wAxTa4W5Zs=;
	b=Vx4uMuD/nSJG/yu518g2NqOg+/h6JnKa/3opi70MjKFRsTCk4eWAOxxH6b1ghdz8Iu
	HMpzwN6AGTzOuKKm3W+pMEDKAG4p8foNUihxle8JASrdW9TxfuTqjUS9mTj9sPD7zYWW
	jPWeqw4Ic0IzY44lFgw0yG9E0AKTes26BxQoeWH/lBXUTGSR4v6nbDfrPHlHu1bMxnEK
	CkD5VwSdMpg9iWhhJHy8REvYGaccNL7vXguX5qMNjpAp3ihFrB9GC2l6q8MNCIqY177J
	WZB14Vkbsv5ISH+JNFnc3Eo1qMBJtJyttda1pP4d3wZ9LixqU4xQuLfQ+R6CtcAmcLqn
	ywXg==
X-Gm-Message-State: ANhLgQ1SN9jDS7V0qBD701GRzZi+7FXkcFVyuI+nwQbTq2v1SB4IO6qx
	3gK+vOelRnqPXPz0C3vXhg6UuZJajLB/zupaSZ7c
X-Google-Smtp-Source: ADFU+vul3dd78FpyQ/P1xT0CAzUKDA49PHsMIvhi1CMzemU48YH7Min2sbynkoDLmBburfXlTyDJdiTLpwO7v8ADPZw=
X-Received: by 2002:a50:f152:: with SMTP id z18mr12867397edl.31.1585598145722; 
	Mon, 30 Mar 2020 12:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200318215550.es4stkjwnefrfen2@madcap2.tricolour.ca>
	<CAHC9VhSdDDP7Ec-w61NhGxZG5ZiekmrBCAg=Y=VJvEZcgQh46g@mail.gmail.com>
	<20200319220249.jyr6xmwvflya5mks@madcap2.tricolour.ca>
	<CAHC9VhR84aN72yNB_j61zZgrQV1y6yvrBLNY7jp7BqQiEDL+cw@mail.gmail.com>
	<20200324210152.5uydf3zqi3dwshfu@madcap2.tricolour.ca>
	<CAHC9VhTQUnVhoN3JXTAQ7ti+nNLfGNVXhT6D-GYJRSpJHCwDRg@mail.gmail.com>
	<20200330134705.jlrkoiqpgjh3rvoh@madcap2.tricolour.ca>
	<CAHC9VhQTsEMcYAF1CSHrrVn07DR450W9j6sFVfKAQZ0VpheOfw@mail.gmail.com>
	<20200330162156.mzh2tsnovngudlx2@madcap2.tricolour.ca>
	<CAHC9VhTRzZXJ6yUFL+xZWHNWZFTyiizBK12ntrcSwmgmySbkWw@mail.gmail.com>
	<20200330174937.xalrsiev7q3yxsx2@madcap2.tricolour.ca>
In-Reply-To: <20200330174937.xalrsiev7q3yxsx2@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 30 Mar 2020 15:55:36 -0400
Message-ID: <CAHC9VhR_bKSHDn2WAUgkquu+COwZUanc0RV3GRjMDvpoJ5krjQ@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02UJtsen011130
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, linux-api@vger.kernel.org,
	containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 30, 2020 at 1:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-30 13:34, Paul Moore wrote:
> > On Mon, Mar 30, 2020 at 12:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > On 2020-03-30 10:26, Paul Moore wrote:
> > > > On Mon, Mar 30, 2020 at 9:47 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > On 2020-03-28 23:11, Paul Moore wrote:
> > > > > > On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > > > On 2020-03-23 20:16, Paul Moore wrote:
> > > > > > > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> > > > > > > > > On 2020-03-18 18:06, Paul Moore wrote:

...

> > > Well, every time a record gets generated, *any* record gets generated,
> > > we'll need to check for which audit daemons this record is in scope and
> > > generate a different one for each depending on the content and whether
> > > or not the content is influenced by the scope.
> >
> > That's the problem right there - we don't want to have to generate a
> > unique record for *each* auditd on *every* record.  That is a recipe
> > for disaster.
>
> I don't see how we can get around this.
>
> We will already have that problem for PIDs in different PID namespaces.

As I said below, let's not worry about this for all of the
known/current audit records, lets just think about how we solve this
for the ACID related information.

One of the bigger problems with translating namespace info (e.g. PIDs)
across ACIDs is that an ACID - by definition - has no understanding of
namespaces (both the concept as well as any given instance).

> We already need to use a different serial number in each auditd/queue,
> or else we serialize *all* audit events on the machine and either leak
> information to the nested daemons that there are other events happenning
> on the machine, or confuse the host daemon because it now thinks that we
> are losing events due to serial numbers missing because some nested
> daemon issued an event that was not relevant to the host daemon,
> consuming a globally serial audit message sequence number.

This isn't really relevant to the ACID lists, but sure.

> > Solving this for all of the known audit records is not something we
> > need to worry about in depth at the moment (although giving it some
> > casual thought is not a bad thing), but solving this for the audit
> > container ID information *is* something we need to worry about right
> > now.
>
> If you think that a different nested contid value string per daemon is
> not acceptable, then we are back to issuing a record that has only *one*
> contid listed without any nesting information.  This brings us back to
> the original problem of keeping *all* audit log history since the boot
> of the machine to be able to track the nesting of any particular contid.

I'm not ruling anything out, except for the "let's just completely
regenerate every record for each auditd instance".

> What am I missing?  What do you suggest?

I'm missing a solution in this thread, since you are the person
driving this effort I'm asking you to get creative and present us with
some solutions. :)


-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

