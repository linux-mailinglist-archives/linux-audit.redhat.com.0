Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 818E1A3FB7
	for <lists+linux-audit@lfdr.de>; Fri, 30 Aug 2019 23:37:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E2C4300BEA6;
	Fri, 30 Aug 2019 21:37:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B49B95DA8B;
	Fri, 30 Aug 2019 21:36:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BB471802218;
	Fri, 30 Aug 2019 21:36:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ULaboj005315 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 17:36:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 570B75D721; Fri, 30 Aug 2019 21:36:37 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 524235D717
	for <linux-audit@redhat.com>; Fri, 30 Aug 2019 21:36:35 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB34E3001ACB
	for <linux-audit@redhat.com>; Fri, 30 Aug 2019 21:36:33 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id m24so7736316ljg.8
	for <linux-audit@redhat.com>; Fri, 30 Aug 2019 14:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XMZWKko+ASVT2TCnNlqNttXBAJkFIN4ztuF0Hu7LsTw=;
	b=X1gvas1I05qTsw5aRndWhgeH4Sd1K8y15NLruTKX0LLi0JhaMtpud1ERzMvci5sod0
	XtPdY+yepT0CP/gIm+y2XhimptqhGFQD0MxuA0yQRE96uebkXhYlHtOGxm8EFJqoA3Z2
	6UD0lSO1AHGsEGq1RxU+QAtdl2+9k3X0hnwqToiBd9Qbwr0PHnHGHSFx9A5WLdxZUxVZ
	/tlVKIZWrfjgHp0xsLbWH7COEUckRAPQzKErC9pU5btdOgc+7C+Rz8kMKxVihzQIGso9
	BYQl+jQ+gsEHx6Kqa8o3MF/KNOx1xmsUz5wwxUxMBfa2WLL2en+iAmHMazsmXOT1ubAu
	iCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XMZWKko+ASVT2TCnNlqNttXBAJkFIN4ztuF0Hu7LsTw=;
	b=WKgTbeuRQk2qTgyJztC9/lIdrixRve6tnTTSWKoq6hmGUHo4RhZPkBws0C1NLUseN5
	CN/4ugQm/hV8kTXi1tPg717FjkbhJikqES2CCwOwE/dhfc3lI1HOPKyx1Ml3lCFrIy2Q
	ESDdZ83t14yMrXIoyNnr0jgnoWXN+u3LxCHjz5+Nekom+2Yt5n/nSDgUx8PsRiQtpWrC
	zuD260TrKwcufnfcWOkUxN5Gb9AmqIXRMtHBDfvJus8Lcf00eg+hQrHBBOlhLrLnfOmU
	thZN8ycC4zghOTqvedeVf8VkunxORZ8CwYBfvl7ewTWYtKJnTwq0TUHI+LB9qdodnrRy
	4ECQ==
X-Gm-Message-State: APjAAAWTtjUJsa7dpjRfcjtyFUQOA1qvAu556iMrQOHt0GaxzAxVb9L2
	RCh1KgQCeoGvsca5X9SpDZ3PYo3AKYb2zjARCyYh
X-Google-Smtp-Source: APXvYqxN58iqSTPhCSXTXwCNYVxXTgrmsQQzuBl6M6p3v3BOy43vHoXsjfgnk4HjmSAUeq/WqHoa7HIAVHKNOFpWmyA=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr9362023ljo.87.1567200992082; 
	Fri, 30 Aug 2019 14:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190815174111.6309-1-acgoide@tycho.nsa.gov>
	<edfe85bc-108a-f0cb-8678-67dc143284d5@tycho.nsa.gov>
	<c5156aaf-e361-65e6-3ca5-89f17fee54bd@schaufler-ca.com>
In-Reply-To: <c5156aaf-e361-65e6-3ca5-89f17fee54bd@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 30 Aug 2019 17:36:21 -0400
Message-ID: <CAHC9VhQhDQ1TQcdEmTNsgZUgMLWpFm38U1D4GwungW7xPb1X_w@mail.gmail.com>
Subject: Re: [RFC PATCH] audit, security: allow LSMs to selectively enable
	audit collection
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 30 Aug 2019 21:36:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 30 Aug 2019 21:36:34 +0000 (UTC) for IP:'209.85.208.196'
	DOMAIN:'mail-lj1-f196.google.com'
	HELO:'mail-lj1-f196.google.com' FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.196 mail-lj1-f196.google.com 209.85.208.196
	mail-lj1-f196.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: rgb@redhat.com, James Morris <jmorris@namei.org>,
	Aaron Goidel <acgoide@tycho.nsa.gov>, selinux@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 30 Aug 2019 21:37:02 +0000 (UTC)

On Fri, Aug 30, 2019 at 11:31 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 8/30/2019 6:44 AM, Stephen Smalley wrote:
> > On 8/15/19 1:41 PM, Aaron Goidel wrote:
> >> Presently, there is no way for LSMs to enable collection of supplemental
> >> audit records such as path and inode information when a permission denial
> >> occurs. Provide a LSM hook to allow LSMs to selectively enable collection
> >> on a per-task basis, even if the audit configuration would otherwise
> >> disable auditing of a task and/or contains no audit filter rules. If the
> >> hook returns a non-zero result, collect all available audit information. If
> >> the hook generates its own audit record, then supplemental audit
> >> information will be emitted at syscall exit.
> >>
> >> In SELinux, we implement this hook by returning the result of a permission
> >> check on the process. If the new process2:audit_enable permission is
> >> allowed by the policy, then audit collection will be enabled for that
> >> process. Otherwise, SELinux will defer to the audit configuration.
> >
> > Any feedback on this RFC patch?  I know Paul provided some thoughts on the general topic of LSM/audit enablement in the other patch thread but I haven't seen any response to this patch.
>
> Audit policy should be independent of security module policy.
> I shouldn't have to change SELinux policy to enable this data
> collection. I should be able to change the audit configuration
> to get this if I want it.

The idea is that the LSM can request that the audit subsystem
selectively enable auditing (per-task, and hopefully per-record-type);
the audit policy can still be configured as you normally.  This is to
work around people (and distros) that disable audit, yet still want to
audit some information (yeah, I know ...).

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
