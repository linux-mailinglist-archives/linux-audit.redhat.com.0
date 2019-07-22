Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CEB70CA4
	for <lists+linux-audit@lfdr.de>; Tue, 23 Jul 2019 00:31:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC30C30917AC;
	Mon, 22 Jul 2019 22:31:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 665A55D721;
	Mon, 22 Jul 2019 22:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1873F41F40;
	Mon, 22 Jul 2019 22:30:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6MMUqJl003485 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 22 Jul 2019 18:30:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B95CD601B6; Mon, 22 Jul 2019 22:30:52 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3EB761352
	for <linux-audit@redhat.com>; Mon, 22 Jul 2019 22:30:50 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
	[209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07CAC3082138
	for <linux-audit@redhat.com>; Mon, 22 Jul 2019 22:30:49 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b29so20601141lfq.1
	for <linux-audit@redhat.com>; Mon, 22 Jul 2019 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2AiaXD3U1auZ1486GxBr4ufJjN1xzy+PJm8wSfZTpiA=;
	b=IJngLW6jceZ5XlRkGFJ+atHpEnUk3gBCdO1HB19R8Tjv55JMtKniQNYz52SGNSY9my
	BIJH1Rqa8HV/03WAp09IhSNVwgaTy/9IpaL/+4U97x4BF/d3lNhsAefB5RUTmsUqwpmw
	Wo101Jyb7sHEFw7i+SE6dj8yTWyMO5tWct/leXN6+5nGLWlRfRhv8oRh2QQs1ZH/zwuZ
	rXDNYRQ1fdBThbise7ZX714BvnPARntfyXJOZDoixnx5xs5yD+8rMnOM9vuMy3H6inL4
	fbTwbWE7bUV3h5q6/YjfJEd9EGtlfm2SjI7O1y0OOtnBQnerKFEeKTtQYSHm+ZuoUXbq
	tM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2AiaXD3U1auZ1486GxBr4ufJjN1xzy+PJm8wSfZTpiA=;
	b=aHcYyDDaFoaMMHEIciFcWV0Qnwm4K6w2NAggHs0hzZvfu/JxW+1V7+Krhr6N4Ut9OH
	B6lu8uNWX7gVEqWdoTDoQFVvQ3csqS6Uey+JsKFMHDjD5bZFC7qzN/d/4/FLLwxJ0VBx
	4PBhB3NzDPE2j2UgvxmCM82YeosXo+KewdmpcTo8xLEmu+vn2ku/jEPcJ3MAaBVFKFRV
	PV0/WMPLPx6MKN2lKqU2eCdWVvVVYeM0B6FsiAIJMCoMr9OVTwOCLv9KtT51uy8jyuix
	v4izg2noq9dedAphDS/QcVZ+J+SR8XbKgYI9aic+QBwyEO/ZKfA927WdNIoNt55mIzXv
	HfFg==
X-Gm-Message-State: APjAAAUOqiSJK3ZmfRv3eH6OLaqsbA9AFxuKeBYqFcjJFN/e/FFw0shh
	PGB0pyACn/UXlDNNhaxeK2awgUiyfqOgYDqN8w==
X-Google-Smtp-Source: APXvYqwlGoXpZwxfgO/t/CjwBYYUj9u/rNilXIAAyazjWiXI/o083lCsGSopA1Fq2OuvHxyEr6uIkkI/lkm9spiOWfI=
X-Received: by 2002:ac2:4644:: with SMTP id s4mr32747861lfo.158.1563834647239; 
	Mon, 22 Jul 2019 15:30:47 -0700 (PDT)
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
	<CAHC9VhQS9We1TNqRfuR_E-kV4aZddx9euaiv5Gzd5B5AkiDAUQ@mail.gmail.com>
	<f375c23c-29e6-dc98-d71c-328db91117bc@schaufler-ca.com>
	<CAHC9VhTf0yYDZBxOtfv2E5=GtrBYonoqr46hyBy7qdNdjVLoVg@mail.gmail.com>
	<alpine.LRH.2.21.1907230649460.18217@namei.org>
	<ca22ea45-3f3b-4f79-8d77-7528877b8b36@schaufler-ca.com>
In-Reply-To: <ca22ea45-3f3b-4f79-8d77-7528877b8b36@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 22 Jul 2019 18:30:35 -0400
Message-ID: <CAHC9VhSbg7BxPSA4NkQV3_1zx6cj3ej25e6fJ2FBWX9fU104rg@mail.gmail.com>
Subject: Re: Preferred subj= with multiple LSMs
To: Casey Schaufler <casey@schaufler-ca.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 22 Jul 2019 22:30:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 22 Jul 2019 22:30:49 +0000 (UTC) for IP:'209.85.167.44'
	DOMAIN:'mail-lf1-f44.google.com' HELO:'mail-lf1-f44.google.com'
	FROM:'paul@paul-moore.com' RCPT:''
X-RedHat-Spam-Score: 0.002  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.167.44 mail-lf1-f44.google.com 209.85.167.44
	mail-lf1-f44.google.com <paul@paul-moore.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: linux-audit@redhat.com
Cc: Richard Guy Briggs <rgb@redhat.com>,
	Linux Security Module list <linux-security-module@vger.kernel.org>,
	James Morris <jmorris@namei.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 22 Jul 2019 22:31:04 +0000 (UTC)

On Mon, Jul 22, 2019 at 6:01 PM Casey Schaufler <casey@schaufler-ca.com> wrote:
> On 7/22/2019 1:50 PM, James Morris wrote:
> > On Fri, 19 Jul 2019, Paul Moore wrote:
> >
> >>> We've never had to think about having general rules on
> >>> what security modules do before, because with only one
> >>> active each could do whatever it wanted without fear of
> >>> conflict. If there is already a character that none of
> >>> the existing modules use, how would it be wrong to
> >>> reserve it?
> >> "We've never had to think about having general rules on what security
> >> modules do before..."
> >>
> >> We famously haven't imposed restrictions on the label format before
> >> now, and this seems like a pretty poor reason to start.
> > Agreed.
>
> In a follow on thread
>
> https://www.spinics.net/lists/linux-security-module/msg29996.html
>
> we've been discussing the needs of dbus-daemon in a multiple LSM
> environment. I suggest that if supporting dbus well is assisted by
> making reasonable restrictions on what constitutes a valid LSM
> "context" that we have a good reason. While there are ways to
> present groups of arbitrary hunks of data, why would we want to?

I continue to believe that restrictions on the label format are a bad
idea, and I further believe that multiplexing the labels is going to
be a major problem that will haunt us for many, many years.  If we are
going to support multiple simultaneous LSMs I think we need to find a
way to represent those labels independently.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
