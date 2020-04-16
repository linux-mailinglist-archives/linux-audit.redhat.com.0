Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F16381AD241
	for <lists+linux-audit@lfdr.de>; Thu, 16 Apr 2020 23:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587074052;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XScXoA3x8w9/vMRvEtnmBLCioBphp2N0HhvSi9/g5YY=;
	b=iRorG1VrkRsQ3IMaHN5TJb2vk7yfDKGFJykhwvTNmZJe7y5t5MTvHiFmHIzBKiG3DllQ9Z
	ymv3TiH9Floi27OW6rtVBJafKhRyhpzIAsBzDUbN2qu7ttFqv3xbxH/k3i8WhpOLPDEtNM
	y/Q/t2PiAvhYBW9ZCBF98eyyNhR4CNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-BGaf60POOFGFKSCPtPAumA-1; Thu, 16 Apr 2020 17:54:11 -0400
X-MC-Unique: BGaf60POOFGFKSCPtPAumA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B966107B7D8;
	Thu, 16 Apr 2020 21:54:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D729110016E8;
	Thu, 16 Apr 2020 21:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 709E818034EA;
	Thu, 16 Apr 2020 21:53:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GLrfLr004835 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 17:53:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 412742026E1C; Thu, 16 Apr 2020 21:53:41 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2472026D66
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 21:53:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5308B800296
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 21:53:39 +0000 (UTC)
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
	[209.85.218.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-ukKx79JjNaqcYfUMc1plYg-1; Thu, 16 Apr 2020 17:53:36 -0400
X-MC-Unique: ukKx79JjNaqcYfUMc1plYg-1
Received: by mail-ej1-f68.google.com with SMTP id q8so21668eja.2
	for <linux-audit@redhat.com>; Thu, 16 Apr 2020 14:53:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eUNGgddkQnrL1o2hsZswaMALGVl9JsvHDg1XmEFxRXs=;
	b=UIH+QOU9EQTVeGWjUP0KG+87jW2NOGzIAur52Vvcoevnlh1LwnuNHpJMnhoQSp8HVe
	USuI7+s+j7LyWbD2rc9MSBTY6aDao+84WrwnIF7A5fDFQu3qhACwQqSy6jlAcArUYE7d
	gHicqiDZQ95ACGmVwMBuwouEIcbTuy1GetrxBTTvRJmt5NlOWfDdM5xkZwkSCUykjc9V
	OanMAScYwrMsxgKJjjuTdPdlifhl52GWoSM3Vw4YMXmj8YO48x1nmXWtCQPYPYJyyKRg
	ahA6OB3anxFgaesABToLBaTlbJCug4Fn3QlY3ilhs7CsnJmCKMz4oGF3tdPgZdN8OWJP
	9KJA==
X-Gm-Message-State: AGi0PuZnBxa3wE3I+50YrtNI4BJKc3F9SoX3YW9UiHtjj36jn4KMgCpC
	ywUZ5Wzb38WRyG/MTQczBtMLIoGzG9ll5gwVapn2
X-Google-Smtp-Source: APiQypL+BE3uA1SW0Bujmyp0BjjA9VEPrFMXVzQljtvXfQzPxFQdYF4edXGWSKCfJiLORwzoe3+Py9YdpYXjI/hRt+E=
X-Received: by 2002:a17:906:d7a2:: with SMTP id
	pk2mr118612ejb.272.1587074015141; 
	Thu, 16 Apr 2020 14:53:35 -0700 (PDT)
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
	<CAHC9VhR_bKSHDn2WAUgkquu+COwZUanc0RV3GRjMDvpoJ5krjQ@mail.gmail.com>
	<871ronf9x2.fsf@x220.int.ebiederm.org>
In-Reply-To: <871ronf9x2.fsf@x220.int.ebiederm.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 16 Apr 2020 17:53:23 -0400
Message-ID: <CAHC9VhR3gbmj5+5MY-whLtStKqDEHgvMRigU9hW0X1kpxF91ag@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: "Eric W. Biederman" <ebiederm@xmission.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03GLrfLr004835
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	simo@redhat.com, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Apr 16, 2020 at 4:36 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> Paul Moore <paul@paul-moore.com> writes:
> > On Mon, Mar 30, 2020 at 1:49 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> On 2020-03-30 13:34, Paul Moore wrote:
> >> > On Mon, Mar 30, 2020 at 12:22 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> > > On 2020-03-30 10:26, Paul Moore wrote:
> >> > > > On Mon, Mar 30, 2020 at 9:47 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> > > > > On 2020-03-28 23:11, Paul Moore wrote:
> >> > > > > > On Tue, Mar 24, 2020 at 5:02 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> > > > > > > On 2020-03-23 20:16, Paul Moore wrote:
> >> > > > > > > > On Thu, Mar 19, 2020 at 6:03 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >> > > > > > > > > On 2020-03-18 18:06, Paul Moore wrote:
> >
> > ...
> >
> >> > > Well, every time a record gets generated, *any* record gets generated,
> >> > > we'll need to check for which audit daemons this record is in scope and
> >> > > generate a different one for each depending on the content and whether
> >> > > or not the content is influenced by the scope.
> >> >
> >> > That's the problem right there - we don't want to have to generate a
> >> > unique record for *each* auditd on *every* record.  That is a recipe
> >> > for disaster.
> >> >
> >> > Solving this for all of the known audit records is not something we
> >> > need to worry about in depth at the moment (although giving it some
> >> > casual thought is not a bad thing), but solving this for the audit
> >> > container ID information *is* something we need to worry about right
> >> > now.
> >>
> >> If you think that a different nested contid value string per daemon is
> >> not acceptable, then we are back to issuing a record that has only *one*
> >> contid listed without any nesting information.  This brings us back to
> >> the original problem of keeping *all* audit log history since the boot
> >> of the machine to be able to track the nesting of any particular contid.
> >
> > I'm not ruling anything out, except for the "let's just completely
> > regenerate every record for each auditd instance".
>
> Paul I am a bit confused about what you are referring to when you say
> regenerate every record.
>
> Are you saying that you don't want to repeat the sequence:
>         audit_log_start(...);
>         audit_log_format(...);
>         audit_log_end(...);
> for every nested audit daemon?

If it can be avoided yes.  Audit performance is already not-awesome,
this would make it even worse.

> Or are you saying that you would like to literraly want to send the same
> skb to each of the nested audit daemons?

Ideally we would reuse the generated audit messages as much as
possible.  Less work is better.  That's really my main concern here,
let's make sure we aren't going to totally tank performance when we
have a bunch of nested audit daemons.

> Or are you thinking of something else?

As mentioned above, I'm not thinking of anything specific, other than
let's please not have to regenerate *all* of the audit record strings
for each instance of an audit daemon, that's going to be a killer.

Maybe we have to regenerate some, if we do, what would that look like
in code?  How do we handle the regeneration aspect?  I worry that is
going to be really ugly.

Maybe we finally burn down the audit_log_format(...) function and pass
structs/TLVs to the audit subsystem and the audit subsystem generates
the strings in the auditd connection thread.  Some of the record
strings could likely be shared, others would need to be ACID/auditd
dependent.

I'm open to any ideas people may have.  We have a problem, let's solve it.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

