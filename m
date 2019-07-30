Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D217B5E2
	for <lists+linux-audit@lfdr.de>; Wed, 31 Jul 2019 00:52:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82D04308FB93;
	Tue, 30 Jul 2019 22:51:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 396A35D6A7;
	Tue, 30 Jul 2019 22:51:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93BF61800202;
	Tue, 30 Jul 2019 22:51:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UMpjGV000943 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 18:51:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 762AC5C1B4; Tue, 30 Jul 2019 22:51:45 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 717BF5C1A1
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 22:51:42 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68A408552A
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 22:51:40 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id i21so63680046ljj.3
	for <linux-audit@redhat.com>; Tue, 30 Jul 2019 15:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=L2Wmgzc5UIFazNFqSnI4ddb17Ht0mtVMvRcs2OwpnYo=;
	b=WOOxP3OqpobkOolrQngqeQl1taPT/5zYkMzUCE2iXAb49uqT+53yLDktHSO18sSvab
	M2wFJZANDFvl0Qra1DDdSU6LhRK8RUxxeIZoAAQ8kvkWwf9PVaYXuBaECy3HVd5CIIQD
	ZA3FjFMV3e83Mm6ZT40FIOBinhjHV7w7e8WWf+TxcQHs4hNo7p4AC/1sz9JACPYLWpre
	/FM8oEF7aBUWTSnPdEWyo3ZaQ0yL57mKCrmZ89KbQt2/PBU+Dh79hfn+ypDxUWAQoxO8
	nZJBmSoLI2mBzrSastwzGUXpY4Oq4y1jyy6uUSYJ0gKasg2LRzYFa+RBMi60gj9BRmZg
	LIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=L2Wmgzc5UIFazNFqSnI4ddb17Ht0mtVMvRcs2OwpnYo=;
	b=klQsmeGdlTu5Pz1Jd5xfNUuFpzpG1DaYVfvcD9PKlZidpSTjm7MrikiI/jDJWUqZ4E
	kIZuDy7h035OOwknkSZd/JDxiirZcvtlAFajzoHZqGt63knxja7X+aYBUiHUPmJoHroP
	GcXQdh2u8YC1vidss6goOm8Hh+eauwiEg0u3sOfYsevappyE3YUAyxVESCBn+F6NaTLo
	Dj7Vk76FTHs8MabUTxg6TtUGDhZYvv9LfJXPbu/psC7n466dIQXynnrhsiyedRitgBXo
	6sSp+iQt0tIQlN/nU75Dm/apER96lB1aAdi4mcG1ViYvBieVnGwWA/xdC8zrHDeDfbqT
	59Vw==
X-Gm-Message-State: APjAAAVXoTzTtHs6MQNR8mB7bichxNkq6vXdXSymEqW3kkLneyWmaNZx
	gmIvMG8oYeygCwtpfD8emTiVicLSKo+R7jPVMRI6
X-Google-Smtp-Source: APXvYqyjHidVJvkHUisIF1Qgksh7k4CbYkUfb8eK2Q9IoV7sAbzv1owL9BdtZhAo72SM5Z3ylrXnFIDfRo9pfS6/CJ0=
X-Received: by 2002:a2e:5bdd:: with SMTP id m90mr59771171lje.46.1564527098600; 
	Tue, 30 Jul 2019 15:51:38 -0700 (PDT)
MIME-Version: 1.0
References: <e8fbd095-9983-528e-dc8e-602280b414d8@magitekltd.com>
	<20190729223249.wvzvqmjwzxeg4p54@madcap2.tricolour.ca>
	<f30a6c9e-e203-9e29-139a-dda3aa0e73f9@magitekltd.com>
	<20190730213613.deuqgp433ieumuge@madcap2.tricolour.ca>
	<a5522d49-6871-d10c-789a-afb53f19c030@magitekltd.com>
In-Reply-To: <a5522d49-6871-d10c-789a-afb53f19c030@magitekltd.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 30 Jul 2019 18:51:27 -0400
Message-ID: <CAHC9VhTPNBJonUJtfJ09gtAFihKG3=ax=TSM6Qhf95KuuuWLmw@mail.gmail.com>
Subject: Re: boot parameter question
To: Lenny Bruzenak <lenny@magitekltd.com>, Richard Guy Briggs <rgb@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 30 Jul 2019 22:51:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 30 Jul 2019 22:51:40 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: linux-audit@redhat.com
Cc: "Linux-audit@redhat.com" <linux-audit@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 30 Jul 2019 22:52:02 +0000 (UTC)

On Tue, Jul 30, 2019 at 5:52 PM Lenny Bruzenak <lenny@magitekltd.com> wrote:
> On 7/30/19 3:36 PM, Richard Guy Briggs wrote:
> > On 2019-07-30 15:06, Lenny Bruzenak wrote:
> >> On 7/29/19 4:32 PM, Richard Guy Briggs wrote:
> >>> It is being ignored because that kernel command line extension to the
> >>> original feature was never backported to RHEL7.
> >> That would definitely do it.
> >>
> >>> In hindsight, that would have been pretty useful without causing much
> >>> risk.  Normally feature backport is driven by customer demand.  There
> >>> was a bit of pushback when it was first introduced upstream, but this is
> >>> exactly the scenario I envisioned where it would be most useful.  It is
> >>> possible to compile your own kernel and change the default value, but
> >>> that's obviously a hurdle for most.
> >> It would definitely have been useful, some might say even necessary,
> >> given the audit event startup noise occurring with systemd.
> > Yes, this was yet another difficulty that arose with the change to
> > systemd from rhel6 to rhel7.  The intent was to solve it first in fedora
> > when it switched to systemd to address this since the number of startup
> > messages jumped from manageable within the default backlog size to
> > almost double.  There are also other improvements upstream that remove
> > some of the doubt about exactly how many log messages were lost.
> >
> >> Wow. Thanks Richard, I appreciate the answer on this.
> > It is all there in fedora and RHEL8, so that is one possible route.  It
> > is a bit late in the RHEL7 life cycle to commit to it, but not
> > impossible...
>
> Thanks Richard and I do appreciate the insight.
>
> For some it might be possible to switch OS baselines effortlessly,
> others (including my group) it isn't.
>
> I'm surprised other RHEL 7 consumers are not squawking; I wonder if they
> do not appreciate what they are not seeing? Or perhaps they are not
> starting as many services early in the boot sequence and therefore
> getting that one?

As a gentle reminder, this is the *upstream* Linux audit mailing list;
discussion about distro specific issues, especially older distros with
"enterprise" support, are best done offline via that distro's support
mechanism :)

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
