Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C98E6539DD
	for <lists+linux-audit@lfdr.de>; Thu, 22 Dec 2022 00:40:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671666033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iIp0E6ePwyAsOPxJE0VmmhR0AOlUOBEOTjyhCg48KjE=;
	b=YZPSFg85aj/jrpvNQfMPCnZkMKNEUeXZMixZy5BDEgO67McxX1QUn+Ll+3SSY+dAmwgm0o
	rs2aXAk5xj7/r5LNzvwQlq5giMc1q2fPS0I0Y8oOn4BvIllGDi4ejc28mJ+ipriw5uQxU7
	P05QSn6aytzHW476wqVQ+hMI9FopagA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-CF00hGJCONWbGeRuZDJ0Rg-1; Wed, 21 Dec 2022 18:40:31 -0500
X-MC-Unique: CF00hGJCONWbGeRuZDJ0Rg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FA418588E0;
	Wed, 21 Dec 2022 23:40:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B45A4C16029;
	Wed, 21 Dec 2022 23:40:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAE0D19465B6;
	Wed, 21 Dec 2022 23:40:21 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D1EC419465A4 for <linux-audit@listman.corp.redhat.com>;
 Wed, 21 Dec 2022 23:40:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7711540C2004; Wed, 21 Dec 2022 23:40:19 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4558340C2064
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 23:40:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29B03811E6E
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 23:40:19 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-1tkoifY7OkyGnTMhg-CdhA-1; Wed, 21 Dec 2022 18:40:17 -0500
X-MC-Unique: 1tkoifY7OkyGnTMhg-CdhA-1
Received: by mail-pl1-f181.google.com with SMTP id 4so424107plj.3
 for <linux-audit@redhat.com>; Wed, 21 Dec 2022 15:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s4PdcQLU+sw0Bu/jkOMuqOSAtgPdGWi6rAbrUnd5Mhg=;
 b=cEdHfyzo/5238dcIyRKhXB4omaUsOjWcS8rX5P6xQz3KbmVbsYk0wdWQhrRU2m4SOH
 VsUHsXtZqZ7R/wIaBfBLbsxpnv4eQBNxG2SninNS3hz/z4Egg6wwuooqK6tu+TFmvqja
 Wb10o9sKMg8BnPtwoQfeGmAMm3SIiBMXcwHUUfmiF5ybQLIQmvIYpXAP6sTFQGXQWCXJ
 HFVDg7lo2eK09s7ARbeaxamONrsPfTy35MVgYtABuqiAdsBT44vLr2I4G0/qQRukKP/M
 yk2Eue8N7DyIVvPSDR1A+kKpCwwAFrWWND4NJNUG9948s3pHDhShHjrPZf6vkFQhFP9T
 rLgA==
X-Gm-Message-State: AFqh2kq4uBSv+7la4KeKyAtp4Ew2nqNhk0M+eUfUiTq9qfzkGJOSsytq
 rOrKg0CcqJaAUMgCYs1rsg5WlZpHvrgTIFFSoVmIWbXh/84E
X-Google-Smtp-Source: AMrXdXuEknqct15TRvdZtc3Wz+30FFvc3N11aNoN2abWHQ5L6H/Mh5JpApp/3S3yBH42f2yOZ5H1+oMUsqTP8BT/ITo=
X-Received: by 2002:a17:90b:87:b0:219:8ee5:8dc0 with SMTP id
 bb7-20020a17090b008700b002198ee58dc0mr320080pjb.72.1671666016097; Wed, 21 Dec
 2022 15:40:16 -0800 (PST)
MIME-Version: 1.0
References: <df1eacecc605f856fa80d66d81eddea4dc70ce56.camel@iinet.net.au>
 <5652312.DvuYhMxLoT@x2>
 <602700a68fa5b8d68baef4368eaa5e8adf3799a3.camel@iinet.net.au>
 <CAHC9VhSNq5xzpB2jzxK5oFQAM2uGefihCYH0iq91=0Lm=D8jig@mail.gmail.com>
 <CAHC9VhTTnhT5pwpa4jjbE+2fTc1aO5oAiVoP9ERm-khC+EkLMQ@mail.gmail.com>
 <36184353421ebef0ee90653ecc71e1a80d9a0040.camel@swtf.dyndns.org>
In-Reply-To: <36184353421ebef0ee90653ecc71e1a80d9a0040.camel@swtf.dyndns.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 21 Dec 2022 18:40:05 -0500
Message-ID: <CAHC9VhSL4NYNXuc629b=CzDzLqg67T-mjp3hiiet_JfzPYC1ug@mail.gmail.com>
Subject: Re: BPF audit logs
To: burn@swtf.dyndns.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 21, 2022 at 4:03 PM Burn Alting <burn@swtf.dyndns.org> wrote:
> As Steve suggests, it would have value to provide more information (name, tag, uid) and I don't know if it's possible
> but relate it to the bpf syscall's file descriptor for the map created or program loaded (the exit value).

I'm primarily focused on the bogus ID during load, as that is an
obvious regression that needs to be addressed as soon as possible.
For various backport/support reasons, I don't want to combine the bug
fix with the feature enhancement of adding new fields.

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

