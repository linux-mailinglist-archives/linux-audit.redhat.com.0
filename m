Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F18724B86
	for <lists+linux-audit@lfdr.de>; Tue,  6 Jun 2023 20:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686076647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=vDmMron/STOVHMiB784ZIv1KBnfLe+go7Y1B0PDjxhs=;
	b=JDfUvO8ZVdkTJL9WyOVL87g3AjOqgquSAxuARom/8vJ5it5bu7/fC0jN3tbkpXGBYcxtDc
	KZpo/7I/lINDZpzNJ8PrhJRZHGG8YHVsRc0A+XKCz/gp2oQYESVmzsylPTtS+3xdRjsFEO
	olboiS4DiDq4oYJL6RmR1dGQ3xIrQLc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-OgyNo7CzOdWlllFRAgYusQ-1; Tue, 06 Jun 2023 14:37:24 -0400
X-MC-Unique: OgyNo7CzOdWlllFRAgYusQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E9C6811E7F;
	Tue,  6 Jun 2023 18:37:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 135631121315;
	Tue,  6 Jun 2023 18:37:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3253519452C2;
	Tue,  6 Jun 2023 18:37:03 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C5FB319465BA for <linux-audit@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 18:32:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CDB08403362; Tue,  6 Jun 2023 18:32:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6AEE477F61
 for <linux-audit@redhat.com>; Tue,  6 Jun 2023 18:32:14 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9462028EA6E7
 for <linux-audit@redhat.com>; Tue,  6 Jun 2023 18:32:14 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-WiYwJyDxMp-0NjKB8f6RLw-1; Tue, 06 Jun 2023 14:32:10 -0400
X-MC-Unique: WiYwJyDxMp-0NjKB8f6RLw-1
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b1fe3a1a73so1459091fa.1; 
 Tue, 06 Jun 2023 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686076326; x=1688668326;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+JSdbrH2ggRyrmwAW5fgPItFICPRV8OR4eC3ovFUCNc=;
 b=OBB3A+FqQ066JNU3aF0Awq8M/nWYbbUHB/CVZ2WkXhxUdNM9hwSbgFiVuD9iPAPcUf
 dt2LU3eKXYIrU3iM1Tnz7Df62l9E/4jV7LRUnhfI2e5lm3Ma7qQWWFvSeC2szIrVLnEl
 TGNKJpGO4mMrPklh0pM3gS78xJawOQ2zGqc3d2IK4U+MbiYFrxEYd127Pw0o3hBalVxK
 geYcB1XBjyI+hQ9+ziL7s3Gy5T2YA71O8tFP0pnExkKG/rjE97BP6QmhEDM5ubYjBAf7
 A9qaX02wwIezmESfnUNN0RItbC6VeI/eAB20zObN+YIhLQDOELOVGfDrP3fxZLtLqBcZ
 J70A==
X-Gm-Message-State: AC+VfDx+rO7D1qjNSjAA/KT84jyKgkImR/4WXJSg6tLLKzh2JvplqfN1
 8tmSM3x8rKaiy3utTpD24k3nvnTJiCQqEOcMYe4X5hhxiPs=
X-Google-Smtp-Source: ACHHUZ7okwkoPNdMGFp0sw2XRj5DDw54hRy3TE3lkkpwAk4LdzNA8sYSMVyO+MQkk2IRydr+eFqioJIojv6T5pUf36o=
X-Received: by 2002:a2e:7a0a:0:b0:2b1:bb66:7b54 with SMTP id
 v10-20020a2e7a0a000000b002b1bb667b54mr1511372ljc.47.1686076326226; Tue, 06
 Jun 2023 11:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKmEH-s9kZn5kqkjb_QHA2X02TWX+utqu365-7cRKMM7E5eVQ@mail.gmail.com>
 <ZH4to0Fc8WykRS+b@madcap2.tricolour.ca>
 <CAMKmEH8nPJc0p3dt84YfcHJJqWSg8U9FPxb0VPmf8fJVJepvRg@mail.gmail.com>
 <ZH5VgjpTytqaj5i5@madcap2.tricolour.ca>
In-Reply-To: <ZH5VgjpTytqaj5i5@madcap2.tricolour.ca>
From: Vincent Abraham <vincent.ahm@gmail.com>
Date: Tue, 6 Jun 2023 18:31:55 -0400
Message-ID: <CAMKmEH_hfOO_9a=QmUC9dQezA_hn0Kj-78hsK5GpXFbNXx2G_w@mail.gmail.com>
Subject: Re: Comprehensive Documentation on the Linux Audit Framework
To: Richard Guy Briggs <rgb@redhat.com>, linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 06 Jun 2023 18:37:02 +0000
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: multipart/mixed; boundary="===============5735662461550231108=="

--===============5735662461550231108==
Content-Type: multipart/alternative; boundary="0000000000007d2f1305fd7a3cba"

--0000000000007d2f1305fd7a3cba
Content-Type: text/plain; charset="UTF-8"

Thanks. Could you also point to portions in the codebase where these
functions are called for monitoring file access? The reason I'm asking for
this is that I'm trying to provide auditing for files of a specific type
and I'm trying to understand how would that work. Any help would be
appreciated.

--0000000000007d2f1305fd7a3cba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks. Could you also point to portions in the codebase w=
here these functions are called for monitoring file access? The reason I&#3=
9;m asking for this is that I&#39;m trying to provide auditing for files of=
 a specific type and I&#39;m trying to understand how would that work. Any =
help would be appreciated.</div>

--0000000000007d2f1305fd7a3cba--

--===============5735662461550231108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============5735662461550231108==--

