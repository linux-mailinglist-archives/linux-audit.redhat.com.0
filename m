Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B856BF91
	for <lists+linux-audit@lfdr.de>; Wed, 17 Jul 2019 18:23:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A55D330842A1;
	Wed, 17 Jul 2019 16:23:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6D860F95;
	Wed, 17 Jul 2019 16:23:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4803C1800202;
	Wed, 17 Jul 2019 16:23:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HGNLeZ016611 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 12:23:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF11317D0F; Wed, 17 Jul 2019 16:23:21 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA72B17D0D
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 16:23:19 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 099A63082134
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 16:23:18 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r9so24239001ljg.5
	for <linux-audit@redhat.com>; Wed, 17 Jul 2019 09:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Vg4G3DPatpZZglap2kcidHVoFfS99grpGsmk6Y5DqkA=;
	b=hHB/3SUH8cF/t5YLtStKG8md1G5Ix3tLJDNU2AxUwEP3dxUwQtheYYKKA4OvGoFUI7
	KWLqdcrVVuXs5VFa0j7p+7rITNoCPShDZw2LlWgTDfhwp6hvrOQvsqYL5EOrTa8b8ALv
	7XCgp2UXGIlt3OH1HRpjRQ/58IQNKG+l7axLKRAoSsvebX+U15aUt7pQj5Qqa7OtkWfi
	uz6EUN9l5G6eDHbCPYfNksdMNlTo5IHZ3jwvFkv6L46SPBVE4Q8ZsyGetNNHzSOOOACf
	S36P+9j47Va6oPTx4lO6CajmCaXb0MsRDZeI3wn7wIQlK73clznJssN027ylrX+XaHjm
	/ocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Vg4G3DPatpZZglap2kcidHVoFfS99grpGsmk6Y5DqkA=;
	b=jVczJqsqCmyKkAPgtrrt5BCE3151EVyIJ1sEXP/BJTKZid9pkx0KsS3Wu/GmOQm4H1
	PvugOynv49opP3x0tTv9rIoq2CrRrivecliMxkWbc7Lx6zA7wP8Zp0ngvEcdy/vmubOp
	wHFYw3IoTOzuCzfYdyaR901/N+LUJoSAEI0DUW4w/YQvGYcblj/ONzc2DtkFNpWh69LG
	nK7N44fYTqIEFu8hZHYxAM2Rf69BSB1KGwpmNAOCj9dwUehLHiRodLKT23tTpPQ2Bh1m
	YxpG63KnaExCTrmXcOSrrwDiy6cBGLY7rRarR5RaXYeEvaCZr/+cLyi592oITUKHX3rr
	bpxw==
X-Gm-Message-State: APjAAAUySig2nMuoHBxtSafLg6KfmZFGwY+qtNiuDnf2TnakJ013UuEr
	eA/cWhEK/yShseBnmWEn7gZNamA3Zvoe30IgfQ==
X-Google-Smtp-Source: APXvYqyIqA7Na/o4Xc5LUrBWw6CUWAopYryohUmTRMn2li1bUdQAWR92rl/9/HQtoeILSf1NaHOin4EPUFVzVbwHuvw=
X-Received: by 2002:a2e:9dc1:: with SMTP id x1mr21537081ljj.0.1563380596232;
	Wed, 17 Jul 2019 09:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <f824828c-5c9d-b91e-5cec-70ee7a45e760@schaufler-ca.com>
	<d1a237d3-4b72-48b0-27d6-fb168354ad31@schaufler-ca.com>
	<CAHC9VhTQLihNQ1iGjJB=LAn=C6BQokFsjsRcj8O_O9AjqQ7HBg@mail.gmail.com>
	<2517266.eHZzEmjMsX@x2>
	<27e2c710-efe6-d9cd-d4f9-bc217df5ede3@schaufler-ca.com>
	<CAHC9VhTpcnyGg5j3b6Z7Yi0Ob01JETRiBmz1AuLqPWqP9tEAnA@mail.gmail.com>
	<5ea2a25b-364f-3c30-79c6-cfb18515d7ba@schaufler-ca.com>
	<CAHC9VhQ9MSh5zCkhMja4r9j0RT952LwKSaG5dR-BqXzXrtEAUw@mail.gmail.com>
	<e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
In-Reply-To: <e9cf875a-0d0f-a56f-71dd-c22c67bdcc2d@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 17 Jul 2019 12:23:04 -0400
Message-ID: <CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 16:23:18 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 16:23:18 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 17 Jul 2019 16:23:34 +0000 (UTC)

On Wed, Jul 17, 2019 at 11:49 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/17/2019 5:14 AM, Paul Moore wrote:
> > On Tue, Jul 16, 2019 at 7:47 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >> On 7/16/2019 4:13 PM, Paul Moore wrote:
> >>> On Tue, Jul 16, 2019 at 6:18 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> >>>> It sounds as if some variant of the Hideous format:
> >>>>
> >>>>         subj=selinux='a:b:c:d',apparmor='z'
> >>>>         subj=selinux/a:b:c:d/apparmor/z
> >>>>         subj=(selinux)a:b:c:d/(apparmor)z
> >>>>
> >>>> would meet Steve's searchability requirements, but with significant
> >>>> parsing performance penalties.
> >>> I think "hideous format" sums it up nicely.  Whatever we choose here
> >>> we are likely going to be stuck with for some time and I'm near to
> >>> 100% that multiplexing the labels onto a single field is going to be a
> >>> disaster.
> >> If the requirement is that subj= be searchable I don't see much of
> >> an alternative to a Hideous format. If we can get past that, and say
> >> that all subj_* have to be searchable we can avoid that set of issues.
> >> Instead of:
> >>
> >>         s = strstr(source, "subj=")
> >>         search_after_subj(s, ...);
> > This example does a lot of hand waving in search_after_subj(...)
> > regarding parsing the multiplexed LSM label.  Unless we restrict the
> > LSM label formats (which seems both wrong, and too late IMHO)
>
> I don't think it's too late, and I think it would be healthy
> to restrict LSM "contexts" to character sets that make command
> line specification possible. Embedded newlines? Ewwww.

That would imply that the delimiter you would choose for the
multiplexed approach would be something odd (I think you suggested
0x02, or similar, earlier) which would likely require the multiplexed
subj field to become a hex encoded field which would be very
unfortunate in my opinion and would technically break with the current
subj/obj field format spec.  Picking a normal-ish delimiter, and
restricting its use by LSMs seems wrong to me.

It's also worth noting that if you were to move subj/obj to hex
encoded fields, in addition to causing a backwards compatibility
problem, you completely kill the ability to look at the raw log data
and make sense of the fields ... well, unless you can do the ascii hex
conversion in your head on the fly.

> >  we have
> > a parsing nightmare; can you write a safe multiplexed LSM label parser
> > without knowledge of each LSM label format?  Can you do that for each
> > LSM without knowing their loaded policy?  What happens when the policy
> > and/or label format changes?  What happens in a few years when another
> > LSM is added to the kernel?
>
> I was intentionally hand-wavy because of those very issues.

Then you should already realize why this is a terrible idea ;)

> Steve says that parsing is limited to "strstr()", so looking for
> ":s7:" in the subject should work just as well with a Hideous
> format as it does today, with the exception of false positives
> where LSMs have label string overlaps.

Today when you go to search through your audit log you know that a
single LSM is providing subj labels, and you also know which LSM that
happens to be, so searching on a given string, or substring, is easy
and generally safe.  In a multiplexed approach this becomes much more
difficult, and depending on the search being done it could be
misleading, perhaps even dangerous with complicated searches that
exclude label substrings.

It's important to remember that Steve's strstr() comment only reflects
his set of userspace tools.  When you start talking about log
aggregation and analytics, it seems very likely that there are other
tools in use, likely with their own parsers that do much more
complicated searches than a simple strstr() call.

> Where is the need to use a module specific label parser coming
> from? Does the audit code parse SELinux contexts now?

If you can't pick a "safe" delimiter that isn't included in any of the
LSM label formats, how else do you know how to parse the multiplexed
mess?

> >> we have
> >>
> >>         s = source
> >>         for (i = 0; i < lsm_slots ; i++) {
> >>                 s = strstr(s, "subj_")
> >>                 if (!s)
> >>                         break;
> >>                 s = search_after_subj_(s, lsm_slot_name[i], ...)
> > The hand waving here in search_after_subj_(...) is much less;
> > essentially you just match "subj_X" and then you can take the field
> > value as the LSM's label without having to know the format, the policy
> > loaded, etc.  It is both safer and doesn't require knowledge of the
> > LSMs (the LSM "name" can be specified as a parameter to the search
> > tool).
>
> You can do that with the Hideous format as well. I wouldn't
> say which would be easier without delving into the audit user
> space.

No, you can't.  You still need to parse the multiplexed mess, that's
the problem.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
