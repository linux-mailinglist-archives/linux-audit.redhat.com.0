Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE36BC2A
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 14:15:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9392307D849;
	Wed, 17 Jul 2019 12:15:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2626D60BF4;
	Wed, 17 Jul 2019 12:15:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B4511800202;
	Wed, 17 Jul 2019 12:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HCEokN004191 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 08:14:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 06BA21001B0E; Wed, 17 Jul 2019 12:14:50 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01AEA1001B2C
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 12:14:47 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 782D03082134
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 12:14:46 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id c19so16277864lfm.10
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 05:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=q8//XbOhkKVpJiK+q5UMQizMtrSss/8pHXbVWHOnp8M=;
	b=YwK2iX9W1nWVBOwPM4N/KC0f3fzRB5TC9Kvv/Nqic/BN1lVsgjCZTYyNwhSQqjw9Mv
	uw43maB2a4lzQ2w1AwD1WOj3g5HZp7Yi1Km3bWmeG/tRhvLiUq12SNSJCDNEAflvit6d
	un1YiwkV/Jhi6SunngBIQP/gFoFJKYdKKnQdeC5O8aSBnG447Ce63Xn8s4TqHotG8154
	5g87d7YqouzL9cbjv9oqlz7sUSpZyml6mr0jy4BqXtEjnjY+3Gh2ibcA+/k2Mh3Ukj4Z
	xkAbCl9KQkz+HTZEHAyFMG8JcgouJRw9F/6VrHyx7B5Mpwd7fGJx7S2Tfbv+hkQjpnRw
	h6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=q8//XbOhkKVpJiK+q5UMQizMtrSss/8pHXbVWHOnp8M=;
	b=lz+n7DMmUq48jAU5jU3ciVZrRkvl3OmkTPWkbyWWK7vASOhOs/zNvlMFgePGudyv/H
	cu7F/1l7f4f3OJKsUngtN0VcFDbyZeDTAG3tVlSFq4I8L+Zri2q25PcD+xQm6L5uVQkN
	B66FQrewrTE3onD3m0mMtQYZKK1/ziw59Dwl8janYLJYA6wMGukxy/gP/XyJ663y5k0w
	IeFknRtjuxQ7Tmh18ZhaGL8wjUzyAkioIeZKJGAJXGWFVUnBU0j7vgZorYBrd5PTvb3O
	YEn6L87SRKtEZZ9Sf39VItXjMrov1WUqoZOaneXrdKj0t6D0SM4qegx+Q7jdSxUgdPWb
	w2SQ==
X-Gm-Message-State: APjAAAX4wRwtKYISBp2VNzTvkLOJXqTcyL2l+ebKdFOdzEOi8hQFThIE
	diMVn+FSg9pidhWkoU1wktlha0CWKRSlQ/Wnpw==
X-Google-Smtp-Source: APXvYqyniYh0/blvwu0++qJJJXZh/FE1QwpFlNlIdDMPfquzHJM4sxsvXSx/ATMHZd1IVN8o4497thCr8hvFn4BhkfY=
X-Received: by 2002:a19:4349:: with SMTP id m9mr17398623lfj.64.1563365684685; 
	Wed, 17 Jul 2019 05:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
	<CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
In-Reply-To: <5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jul 2019 08:14:33 -0400
Message-ID: <CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 12:14:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 12:14:47 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com 209.85.167.65
	mail-lf1-f65.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	"linux-audit@redhat.com" <linux-audit@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 17 Jul 2019 12:15:08 +0000 (UTC)

On Tue, Jul 16, 2019 at 7:47 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/16/2019 4:13 PM, Paul Moore wrote:
> > On Tue, Jul 16, 2019 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> It sounds as if some variant of the Hideous format:
> >>
> >>         subj=selinux='a:b:c:d',apparmor='z'
> >>         subj=selinux/a:b:c:d/apparmor/z
> >>         subj=(selinux)a:b:c:d/(apparmor)z
> >>
> >> would meet Steve's searchability requirements, but with significant
> >> parsing performance penalties.
> > I think "hideous format" sums it up nicely.  Whatever we choose here
> > we are likely going to be stuck with for some time and I'm near to
> > 100% that multiplexing the labels onto a single field is going to be a
> > disaster.
>
> If the requirement is that subj= be searchable I don't see much of
> an alternative to a Hideous format. If we can get past that, and say
> that all subj_* have to be searchable we can avoid that set of issues.
> Instead of:
>
>         s = strstr(source, "subj=")
>         search_after_subj(s, ...);

This example does a lot of hand waving in search_after_subj(...)
regarding parsing the multiplexed LSM label.  Unless we restrict the
LSM label formats (which seems both wrong, and too late IMHO) we have
a parsing nightmare; can you write a safe multiplexed LSM label parser
without knowledge of each LSM label format?  Can you do that for each
LSM without knowing their loaded policy?  What happens when the policy
and/or label format changes?  What happens in a few years when another
LSM is added to the kernel?

> we have
>
>         s = source
>         for (i = 0; i < lsm_slots ; i++) {
>                 s = strstr(s, "subj_")
>                 if (!s)
>                         break;
>                 s = search_after_subj_(s, lsm_slot_name[i], ...)

The hand waving here in search_after_subj_(...) is much less;
essentially you just match "subj_X" and then you can take the field
value as the LSM's label without having to know the format, the policy
loaded, etc.  It is both safer and doesn't require knowledge of the
LSMs (the LSM "name" can be specified as a parameter to the search
tool).

> There's enough ugly to go around either way.
> And I'm not partial to either approach, but do would very
> much like to get the code done so I can get on to the next
> set of amazing challenges.
>
> Oh, and I don't want to pick on subj= as obj= has the exact same issues.

Yes, I stopped talking about both subj and obj some time ago in this
thread because I figure we can use the same approach for both.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
